const fs = require("fs");
const path = require("path");
const child_process = require("child_process");

var globalShaders = {};
var unverifiedShaders = [];
var invalidShaders = [];
var verifiedShaders = [];

const attributeLayoutRegex = /ATTR_LAYOUT\(\d+\s*,\s*(\d+)\)\s*in\s*uvec4\s*([a-zA-Z0-9_]+)\s*;/;
const bufferLayoutRegex = /UNIFORM_BUFFER_LAYOUT\((\d+)\s*,\s*\d+,\s*(\d+)\)(?:\s*uniform\s*([a-zA-Z]+\d)\s*)?/;
const splitBufferLayoutRegex = /uniform\s*([a-zA-Z]+\d+)\s*/;
const textureLayoutRegex = /TEXTURE_LAYOUT\((\d+), \d+, (\d+)\) uniform sampler2D ([a-zA-Z]+\d);/;
const ufBlocklayoutRegex = /layout\(set\s?=\s?\d+,\s?binding\s?=\s?(\d+)\)\s*uniform\s+ufBlock/;
const uniformUfRegex = /^\s*uniform\s+([biuvd]?vec[234]|bool|int|uint|float|double)\s+(uf_alphaTestRef|uf_verticesPerInstance|uf_streamoutBufferBase\[\d+\]|uf_tex\[\d+\]Scale|uf_pointSize|uf_fragCoordScale|uf_windowSpaceToClipSpaceTransform|uf_remappedPS\[\d+\]|uf_remappedVS\[\d+\]|uf_uniformRegisterVS\[\d+\]|uf_uniformRegisterPS\[\d+\])\s*;.*/m;

function extractShaderInfo(shaderText) {
	let shaderInfo = {attributeLayouts: [], bufferLayouts: [], textureLayouts: [], ufBlock: {VKLocation: undefined, ufVariables: []}};
	let shaderLines = shaderText.split("\n");
	
	let ufBlockFlag = false;
	for (let line = 0; line<shaderLines.length; line++) {
		let currLine = shaderLines[line];

		let attributeRegexResult = currLine.match(attributeLayoutRegex);
		let bufferRegexResult = currLine.match(bufferLayoutRegex);
		let textureRegexResult = currLine.match(textureLayoutRegex);
		if (attributeRegexResult != null) {
			shaderInfo.attributeLayouts.push({location: parseInt(attributeRegexResult[1]), name: attributeRegexResult[2]});
		}
		else if (bufferRegexResult != null) {
			if (bufferRegexResult[3] != undefined) {
				shaderInfo.bufferLayouts.push({GLLocation: parseInt(bufferRegexResult[1]), VKLocation: parseInt(bufferRegexResult[2]), name: bufferRegexResult[3]});
			}
			else {
				let splitBufferResult = shaderLines[line+1].match(splitBufferLayoutRegex);
				if (splitBufferResult != null) {
					shaderInfo.bufferLayouts.push({GLLocation: parseInt(bufferRegexResult[1]), VKLocation: parseInt(bufferRegexResult[2]), name: splitBufferResult[1]});
				}
				else {
					console.info(currLine.trim()+" vs "+shaderLines[line+1]);
				}
			}
		}
		else if (textureRegexResult != null) {
			shaderInfo.textureLayouts.push({GLLocation: parseInt(textureRegexResult[1]), VKLocation: parseInt(textureRegexResult[2]), name: textureRegexResult[3]});
		}

		if (ufBlocklayoutRegex.test(currLine)) {
			shaderInfo.ufBlock.VKLocation = parseInt(currLine.match(ufBlocklayoutRegex)[1]);
			ufBlockFlag = true;
		}
		else if (ufBlockFlag && currLine.includes("};")) {
			ufBlockFlag = false;
		}
		else if (ufBlockFlag) {
			let uniformMatch = currLine.match(uniformUfRegex);
			if (uniformMatch != null) {
				if (uniformMatch[2].includes())
				shaderInfo.ufBlock.ufVariables.push({type:uniformMatch[1], name: uniformMatch[2]});
			}
			//else if (!currLine.startsWith("{") && currLine.trim() == "") console.log(currLine);
		}
	}

	if (shaderInfo.ufBlock.VKLocation != undefined) {
		//console.error("This shader doesn't have a ufBlock...", shaderInfo);
	}
	return shaderInfo;
}

function getPresets(rulesText) {
	let rulesPresets = [];
	let rulesLines = rulesText.split("\n");
	let packVersion = undefined;

	let currentSection = "";
	let currentPreset = {name: "", variables: []};

	for (line in rulesLines) {
		if (rulesLines[line].replace(/\s+/g, "").startsWith("version=3")) packVersion = 3;
		if (rulesLines[line].replace(/\s+/g, "").startsWith("version=4")) packVersion = 4;

		if (/^\[(.+)]/.test(rulesLines[line])) {
			if (currentSection == "Preset") {
				rulesPresets.push({name: currentPreset.name, variables: [...currentPreset.variables]});
				currentPreset = null;
			}
			currentSection = rulesLines[line].match(/^\[(.+)]/)[1];
			if (currentSection == "Preset") {
				currentPreset = {name: "", variables: []};
			}
		}

		if (currentSection == "Preset") {
			let nameMatch = rulesLines[line].match(/^name[ ]?=[ ]?([^\n#]+)[ ]?/m);
			if (nameMatch != null) {
				currentPreset.name = nameMatch[1].trim();
			}
			let presetVariable = rulesLines[line].match(/^(?<key>\$[a-zA-Z_]+)(?:(?<isInt>:int))?[ ]*=[ ]*(?<value>\d+\.\d+|\d+|0x[0-9a-fA-F]+|(?<expression>[+\-*\/\(\)\d]+))/m);
			if (presetVariable != null) {
				if (presetVariable.groups.expression != undefined) currentPreset.variables.push({key: presetVariable.groups.key, value: (presetVariable.groups.isInt != undefined ? 666 : 666.666667), isInt: (presetVariable.groups.isInt != undefined)});
				else currentPreset.variables.push({key: presetVariable.groups.key, value: (presetVariable.groups.isInt != undefined ? parseInt(presetVariable.groups.value) : parseFloat(presetVariable.groups.value)), isInt: (presetVariable.groups.isInt != undefined)});
			}
		}
	}
	if (currentSection == "Preset") rulesPresets.push({name: currentPreset.name, variables: [...currentPreset.variables]});

	for (let i=0; i<rulesPresets.length; i++) {
		rulesPresets[i].variables.sort((a, b) => {
			return (b.key.length - a.key.length);
		});
	}

	if (rulesPresets.length == 0) rulesPresets.push({name: "Default", variables: []});
	return [rulesPresets, packVersion];
}

function verifyShader(rulesPresets, dumpShader, shaderText, vulkanSet, shaderPath) {
	// First, remove the Vulkan header
	let shaderLines = shaderText.split("\n");
	let parsingVulkanHeader = false;
	for (line in shaderLines) {
		if (shaderLines[line].trim().startsWith("#ifdef VULKAN")) parsingVulkanHeader = true;
		else if (parsingVulkanHeader && (shaderLines[line].trim().startsWith("#define") || shaderLines[line].trim().startsWith("#else"))) shaderLines[line] = "\r";
		else if (parsingVulkanHeader && shaderLines[line].trim().startsWith("#endif")) break;
		else if (parsingVulkanHeader) console.error("what's this", shaderLines[line]);
	}

	// Replace presets
	for (preset in rulesPresets) {
		let currPreset = rulesPresets[preset];
		let headerlessPresetLines = [];

		for (line in shaderLines) {
			let currLine = shaderLines[line];

			for (presetVar in currPreset.variables) {
				let currPresetVar = currPreset.variables[presetVar];
				let currPresetVarOccur = currLine.split(currPresetVar.key).length-1;
				for (let i=0; i<currPresetVarOccur; i++) {
					if (currPresetVar.isInt) currLine = currLine.replace(currPresetVar.key, currPresetVar.value.toFixed(0));
					else currLine = currLine.replace(currPresetVar.key, currPresetVar.value.toFixed(3));
				}
			}

			headerlessPresetLines.push(currLine);
		}

		// Remove all the unrelated preset code.
		let preprocessedPresetLines = undefined;
		try {
			let preprocessOutput = child_process.spawnSync("glslangValidator.exe", ["--stdin", "-E", "-DVULKAN", "-S "+((vulkanSet == 0) ? "vert" : "frag")], {encoding: "utf8", shell: true, input: headerlessPresetLines.join("\n")});
			if (preprocessOutput.stderr.trim() != "") throw preprocessOutput.stderr;
			preprocessedPresetLines = preprocessOutput.stdout.split("\n");
		}
		catch (err) {
			console.error("An error occured while preprocessing this shader:\r\n", err);
			continue;
		}

		let shaderInfo = extractShaderInfo(preprocessedPresetLines.join("\n"));
		if (shaderInfo.ufBlock.VKLocation == undefined) {
			//console.error(preprocessedPresetLines);
		}

		// Check the dumped shader for matching bindings
		let attributesMatched = true;
		for (attr in shaderInfo.attributeLayouts) {
			let foundMatch = false;
			for (cmpAttr in dumpShader.attributeLayouts) {
				if (dumpShader.attributeLayouts[cmpAttr].name == shaderInfo.attributeLayouts[attr].name && dumpShader.attributeLayouts[cmpAttr].location == shaderInfo.attributeLayouts[attr].location) foundMatch = true;
			}
			if (!foundMatch) attributesMatched = false;
		}
		if (!attributesMatched) console.error("The attributes didn't match.");
		let bufferLayoutsMatched = true;
		for (buffer in shaderInfo.bufferLayouts) {
			let foundMatch = false;
			for (cmpBuffer in dumpShader.bufferLayouts) {
				if (dumpShader.bufferLayouts[cmpBuffer].name == shaderInfo.bufferLayouts[buffer].name && dumpShader.bufferLayouts[cmpBuffer].VKLocation == shaderInfo.bufferLayouts[buffer].VKLocation && dumpShader.bufferLayouts[cmpBuffer].GLLocation == shaderInfo.bufferLayouts[buffer].GLLocation) foundMatch = true;
			}
			if (!foundMatch) bufferLayoutsMatched = false;
		}
		if (!bufferLayoutsMatched) console.error("The buffer layouts didn't match.");
		let textureLayoutsMatched = true;
		for (texture in shaderInfo.textureLayouts) {
			let foundMatch = false;
			for (cmpTexture in dumpShader.textureLayouts) {
				if (dumpShader.textureLayouts[cmpTexture].name == shaderInfo.textureLayouts[texture].name && dumpShader.textureLayouts[cmpTexture].VKLocation == shaderInfo.textureLayouts[texture].VKLocation && dumpShader.textureLayouts[cmpTexture].GLLocation == shaderInfo.textureLayouts[texture].GLLocation) foundMatch = true;
			}
			if (!foundMatch) textureLayoutsMatched = false;
		}
		if (!textureLayoutsMatched) console.error("The texture layouts didn't match.");

		// Check if ufBlock matches
		let ufBlockLocationMatched = true;
		if (shaderInfo.ufBlock.VKLocation != dumpShader.ufBlock.VKLocation) {
			console.error("The ufBlock location differs...");
			ufBlockLocationMatched = false;
		}
		let ufVariableMismatches = [];
		if (shaderInfo.ufBlock.ufVariables.length == dumpShader.ufBlock.ufVariables.length) {
			for (let i=0; i<shaderInfo.ufBlock.ufVariables.length; i++) {
				if (shaderInfo.ufBlock.ufVariables[i].type != dumpShader.ufBlock.ufVariables[i].type || shaderInfo.ufBlock.ufVariables[i].name != dumpShader.ufBlock.ufVariables[i].name) ufVariableMismatches.push(shaderInfo.ufBlock.ufVariables[i]);
			}
		}
		else {
			console.error("Shader didn't have the same amount of uf_* variables:\r\nshader: "+JSON.stringify(shaderInfo.ufBlock)+"\r\ndump: "+JSON.stringify(dumpShader.ufBlock));
			ufBlockMatched = false;
		}
		if (ufVariableMismatches.length != 0) console.error("The uf_* variables didn't match!", ufVariableMismatches);


		if (attributesMatched && bufferLayoutsMatched && textureLayoutsMatched && ufBlockLocationMatched && (ufVariableMismatches.length == 0)) {
			//console.info("The shader matched!");
			verifiedShaders.push(shaderPath);
		}
		else {
			console.error("The shader didn't match... please fix the errors above.");
			if (!invalidShaders.includes(shaderPath)) invalidShaders.push(shaderPath);
		}
	}
}

function verifyPack(analyseFiles, folderArray) {
	if (analyseFiles.shaders.length == 0) return;
	
	let [rulesPresets, packVersion] = getPresets(analyseFiles.rulesText);

	for (shader in analyseFiles.shaders) {
		if (!globalShaders.hasOwnProperty(path.basename(analyseFiles.shaders[shader].name, ".txt"))) {
			console.error("Can't validate this "+path.basename(analyseFiles.shaders[shader].name)+" shader.");
			unverifiedShaders.push(path.join(process.cwd(), ...folderArray, analyseFiles.shaders[shader].name));
			continue;
		}

		console.group("Validating "+analyseFiles.shaders[shader].name+"...");
		verifyShader(rulesPresets, globalShaders[path.basename(analyseFiles.shaders[shader].name, ".txt")], analyseFiles.shaders[shader].shaderText, analyseFiles.shaders[shader].vulkanSet, path.join(process.cwd(), ...folderArray, analyseFiles.shaders[shader].name));
		console.groupEnd();
	}
}

function verifyGraphicPacks(folderArray) {
	let dirEntries = fs.readdirSync(path.join(process.cwd(), ...folderArray), {withFileTypes: true});
	
	for (entry in dirEntries) {
		if (dirEntries[entry].isDirectory()) {
			console.group("Verify "+path.join(process.cwd(), ...folderArray, dirEntries[entry].name));

			let packFiles = fs.readdirSync(path.join(process.cwd(), ...folderArray, dirEntries[entry].name), {withFileTypes: true});
			
			let verifyFiles = {rulesText: undefined, shaders: []};
			for (file in packFiles) {
				if (packFiles[file].isFile() && packFiles[file].name == "rules.txt") {
					verifyFiles.rulesText = fs.readFileSync(path.join(process.cwd(), ...folderArray, dirEntries[entry].name, "rules.txt"), {encoding: "utf8"});
				}
				else if (packFiles[file].isFile() && packFiles[file].name.length >= "0000000000000000_0000000000000000_xx.txt".length && /^[a-zA-Z0-9]{16}_[\w]{16}_[p|v]s/.test(packFiles[file].name)) {
					verifyFiles.shaders.push({name: packFiles[file].name, shaderText: fs.readFileSync(path.join(process.cwd(), ...folderArray, dirEntries[entry].name, packFiles[file].name), {encoding: "utf8"}), vulkanSet: ((packFiles[file].name.substr(34, 2) == "vs") ? 0 : 1)});
				}
				else if (packFiles[file].isDirectory()) {
					verifyGraphicPacks([...folderArray, dirEntries[entry].name]);
					break;
				}
			}
			
			verifyPack(verifyFiles, [...folderArray, dirEntries[entry].name]);
			
			console.groupEnd();
		}
	}
}

function extractDumpInfo(folderPath) {
	shaderEntries = fs.readdirSync(folderPath, {withFileTypes: true});
	for (entry in shaderEntries) {
		let currShaderEntry = shaderEntries[entry];
		if (!currShaderEntry.isFile() || path.extname(currShaderEntry.name) != ".txt" || path.basename(currShaderEntry.name, ".txt").slice(-2) == "gs") continue;

		globalShaders[path.basename(currShaderEntry.name, ".txt")] = extractShaderInfo(fs.readFileSync(folderPath+"/"+currShaderEntry.name, {encoding: "utf8"}));
	}
}

extractDumpInfo("./dump/shaders/");

console.info("Finished gathering information from shader dump.");

verifyGraphicPacks(["graphicPacks", "Enhancements"]);
verifyGraphicPacks(["graphicPacks", "Resolutions"]);
verifyGraphicPacks(["graphicPacks", "Workarounds"]);
verifyGraphicPacks(["graphicPacks", "Mods"]);

console.info("Finished verifying the graphic packs!");
console.info("Verified shaders:");
console.info(verifiedShaders.join("\r\n"));
console.info("Invalid shaders:");
console.info(invalidShaders.join("\r\n"));
console.info("Unverified shaders:");
console.info(unverifiedShaders.join("\r\n"));

if (fs.existsSync("./manual/")) fs.rmdirSync("./manual/", {recursive: true});
fs.mkdirSync("./manual/", {recursive: true});

for (file in invalidShaders) {
	fs.mkdirSync("./manual/"+path.basename(invalidShaders[file], ".txt")+"/", {recursive: true});
	fs.copyFileSync("./dump/shaders/"+path.basename(invalidShaders[file]), "./manual/"+path.basename(invalidShaders[file], ".txt")+"/"+path.basename(invalidShaders[file], ".txt")+".dump");
	fs.copyFileSync(invalidShaders[file], "./manual/"+path.basename(invalidShaders[file], ".txt")+"/"+path.basename(invalidShaders[file]));
}