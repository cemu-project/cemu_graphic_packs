const fs = require("fs");
const path = require("path");
const child_process = require("child_process");

// Main functions

var manualFixingShaders = 0;
var manualCheckingShaders = 0;

const crossHeader = [
	// Vulkan
	"#ifdef VULKAN\r",
	"#define ATTR_LAYOUT(__vkSet, __location) layout(set = __vkSet, location = __location)\r",
	"#define UNIFORM_BUFFER_LAYOUT(__glLocation, __vkSet, __vkLocation) layout(set = __vkSet, binding = __vkLocation, std140)\r",
	"#define TEXTURE_LAYOUT(__glLocation, __vkSet, __vkLocation) layout(set = __vkSet, binding = __vkLocation)\r",
	"#define SET_POSITION(_v) gl_Position = _v; gl_Position.z = (gl_Position.z + gl_Position.w) / 2.0\r",
	"#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale.xy,gl_FragCoord.zw)\r",
	"#define gl_VertexID gl_VertexIndex",
	"#define gl_InstanceID gl_InstanceIndex",
	"#else\r",
	// OpenGL
	"#define ATTR_LAYOUT(__vkSet, __location) layout(location = __location)\r",
	"#define UNIFORM_BUFFER_LAYOUT(__glLocation, __vkSet, __vkLocation) layout(binding = __glLocation, std140) \r",
	"#define TEXTURE_LAYOUT(__glLocation, __vkSet, __vkLocation) layout(binding = __glLocation)\r",
	"#define SET_POSITION(_v) gl_Position = _v\r",
	"#define GET_FRAGCOORD() vec4(gl_FragCoord.xy*uf_fragCoordScale,gl_FragCoord.zw)\r",
	"#endif\r"
];

const samplerTypes = ["sampler1D", "sampler2D", "sampler3D", "samplerCube", "sampler2DRect", "sampler1DArray", "sampler2DArray", "samplerCubeArray","samplerBuffer", "sampler2DMS", "sampler2DMSArray", "sampler1DShadow", "sampler2DShadow", "samplerCubeShadow", "sampler2DRectShadow", "sampler1DArrayShadow", "sampler2DArrayShadow", "samplerCubeArrayShadow"];

// Regex written on https://regex101.com/r/2aAtA1/5
const uniformUfRegex = /^(\s*uniform)\s+([biuvd]?vec[234]|bool|int|uint|float|double)\s+(uf_alphaTestRef|uf_verticesPerInstance|uf_streamoutBufferBase\[\d+\]|uf_tex\[\d+\]Scale|uf_pointSize|uf_fragCoordScale|uf_windowSpaceToClipSpaceTransform|uf_remappedPS\[\d+\]|uf_remappedVS\[\d+\]|uf_uniformRegisterVS\[\d+\]|uf_uniformRegisterPS\[\d+\])\s*;.*/m;

const layoutTextureRegex = /layout\s*\(binding\s*=\s*(\d+)\s*\)\s*/;
const layoutBufferRegex = /layout\s*\(binding\s*=\s*(\d+)\s*(?:,\s*std140|,\s*std430|,\s*shared|,\s*packed)\s*\)\s*/;

const ufVariablesOrder = [
	"uf_remappedVS", "uf_remappedPS", "uf_uniformRegisterVS",
	"uf_uniformRegisterPS", "uf_windowSpaceToClipSpaceTransform",
	"uf_alphaTestRef", "uf_pointSize", "uf_fragCoordScale",
	"uf_tex"/*"\dScale"*/, "uf_verticesPerInstance", "uf_streamoutBufferBase"
];

function convertRules(rulesText, dstPath) {
	let rulesPresets = [];
	let presetsValidation = {};
	let textLines = rulesText.split("\n");
	let prevUsedVersion = undefined;
	
	let currentSection = "";
	let currentPreset = {name: "", variables: []};
	
	for (line in textLines) {
		// Version number parsing
		if (textLines[line].replace(/\s+/g, "").startsWith("version=")) {
			if (textLines[line].replace(/\s+/g, "") != "version=3" && textLines[line].replace(/\s+/g, "") != "version=4") {
				console.log("Why does this rules.txt file have something appended to the version variable?");
			}
			
			if (textLines[line].replace(/\s+/g, "").startsWith("version=3") || textLines[line].replace(/\s+/g, "").startsWith("version=4")) {
				if (prevUsedVersion) console.warn("Why is there a second version definition in this file?");
				prevUsedVersion = parseInt(textLines[line].replace(/\s+/g, "").split("version=")[1]);
				textLines[line] = "version = 4";
			}
			else {
				console.warn("What's this version? "+textLines[line]);
			}
		}
		else {
			// Parse preset variables
			if (/^\[(.+)]/.test(textLines[line])) {
				if (currentSection == "Preset") {
					if (currentPreset.name == "") console.warn("Why does this preset not have a name?");
					
					//console.log("Added new preset called "+currentPreset.name+" with the following variables: "+JSON.stringify(currentPreset));
					rulesPresets.push({name: currentPreset.name, variables: [...currentPreset.variables]});
					currentPreset = null;
				}
				currentSection = textLines[line].match(/^\[(.+)]/)[1];
				if (currentSection == "Preset") {
					currentPreset = {name: "", variables: []};
				}
			}
			
			if (currentSection == "Preset") {
				let nameMatch = textLines[line].match(/^name[ ]?=[ ]?([^\n#]+)[ ]?/m);
				
				if (nameMatch != null) {
					if (currentPreset.name != "") console.warn("Why does this preset have it's name two times?");
					else {
						currentPreset.name = nameMatch[1].trim();
					}
				}
				let presetVariable = textLines[line].match(/^(?<key>\$[a-zA-Z_]+)(?:(?<isInt>:int))?[ ]*=[ ]*(?<value>\d+\.\d+|\d+|0x[0-9a-fA-F]+|(?<expression>[+\-*\/\(\)\d]+))/m);
				if (presetVariable != null) {
					if (presetVariable.groups.expression != undefined) currentPreset.variables.push({key: presetVariable.groups.key, value: (presetVariable.groups.isInt != undefined ? 666 : 666.666667), isInt: (presetVariable.groups.isInt != undefined)});
					else currentPreset.variables.push({key: presetVariable.groups.key, value: (presetVariable.groups.isInt != undefined ? parseInt(presetVariable.groups.value) : parseFloat(presetVariable.groups.value)), isInt: (presetVariable.groups.isInt != undefined)});
					
					if (presetsValidation.hasOwnProperty(presetVariable.groups.key)) presetsValidation[presetVariable.groups.key]++;
					else presetsValidation[presetVariable.groups.key] = 1;
				}
			}
		}
	}
	
	if (currentSection == "Preset") rulesPresets.push({name: currentPreset.name, variables: [...currentPreset.variables]});
	
	// Check for oddities in presets
	for (variable in presetsValidation) {
		if (presetsValidation[variable] != rulesPresets.length) console.warn("This shader doesn't have all the variables in each preset...", presetsValidation, rulesPresets);
	}
	
	// Order variables
	for (let i=0; i<rulesPresets.length; i++) {
		rulesPresets[i].variables.sort((a, b) => {
			return (b.key.length - a.key.length);
		});
	}

	// Add a Default preset if it doesn't have any presets yet since the code relies on that.
	if (rulesPresets.length == 0) rulesPresets.push({name: "Default", variables: []});
	
	fs.writeFileSync(dstPath, textLines.join("\n"));
	return [prevUsedVersion, rulesPresets];
}

function convertShader(shaderText, rulesPresets, folderArray, vulkanSet) {
	let shaderOutput = [];
	let shaderLines = shaderText.split("\n");
	if (!shaderLines[0].startsWith("#")) console.warn("Why does "+path.join(process.cwd(), ...folderArray)+" not have a #version definition on it's first line?");
	let sharedUFBlockAlternativeLine = undefined;

	// First (header, GET_FRAGCOORD, SET_POSITION, ATTR_LAYOUT, GL_ARB_shading_language_packing and GL_ARB_arrays_of_arrays) pass
	{
		let newShaderLines = [];
		let parsingHeader = true;
		
		for (line in shaderLines) {
			let currLine = shaderLines[line];
			
			if (currLine.startsWith("#extension GL_ARB_shading_language_packing")) {
				continue;
			}
			if (currLine.startsWith("#extension GL_ARB_arrays_of_arrays")) {
				continue;
			}
			
			if (parsingHeader && !currLine.startsWith("#")) {
				parsingHeader = false;
				newShaderLines = newShaderLines.concat(crossHeader);
				newShaderLines.push("// This shader was automatically converted to be cross-compatible with Vulkan and OpenGL.\r");
				if (verboseOutput) {
					newShaderLines.push("/*\r");
					newShaderLines.push("Conversion output:\r");
					newShaderLines.push("%CONVERSION_OUTPUT%\r");
					newShaderLines.push("*/\r");
				}
				newShaderLines.push("\r");
				sharedUFBlockAlternativeLine = newShaderLines.length;
			}
			
			if (/(R[\d+]f = )vec4\(gl_FragCoord\.xy\*uf_fragCoordScale,gl_FragCoord\.zw\);/.test(currLine)) {
				newShaderLines.push(currLine.split("=")[0]+"= GET_FRAGCOORD();");
			}
			else if (/R[\d+]i = floatBitsToInt\(vec4\(gl_FragCoord\.xy\*uf_fragCoordScale,gl_FragCoord\.zw\)\);/.test(currLine)) {
				newShaderLines.push(currLine.split("=")[0]+"= floatBitsToInt(GET_FRAGCOORD());");
			}
			else if (/^gl_Position[ ]?=[ ]?(.*);$/m.test(currLine)) {
				newShaderLines.push(`SET_POSITION(${currLine.match(/^gl_Position = (.*);$/m)[1]});`);
			}
			else if (currLine.startsWith("layout(location = ") && currLine.includes(" attrData")) {
				OpenGLLocation = parseInt(currLine.substr(17));
				if (OpenGLLocation == NaN) throw "Tried finding the attrData's OpenGL binding, but returned a NaN.";
				newShaderLines.push(`ATTR_LAYOUT(${vulkanSet}, ${OpenGLLocation})${currLine.split(")")[1]}`);
			}
			else {
				newShaderLines.push(currLine);
			}
		}
		shaderLines = newShaderLines;
	}

	// Second (binding and ufBlock) pass
	{
		let ufBlockLineIndexes = {};
		let consecutiveUfVariables = true;
		let allUfLines = [];
		for (preset in rulesPresets) {
			let currPreset = rulesPresets[preset];
			
			// Add properties to store parsing information.
			currPreset.ufBlockVariables = [];
			currPreset.shaderChanges = new Array(shaderLines.length);
			
			// Fill shaders with presets
			let presetChangedShader = [];
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
				
				presetChangedShader.push(currLine);
			}
			
			// Let glslangValidator pre-parse preprocessor directives
			let preprocessedPresetLines = undefined;
			try {
				let preprocessOutput = child_process.spawnSync("glslangValidator.exe", ["--stdin"/*Pass shader via stdin instead of having to write a file*/, "-E"/*Only preprocessor pass*/, "-S "+(vulkanSet == 0 ? "vert" : "frag")/*Whether shader is a vertex or fragment shader*/], {encoding: "utf8", shell: true, input: presetChangedShader.join("\n")});
				if (preprocessOutput.stderr.trim() != "") throw preprocessOutput.stderr; // Throw an error if glslangValidator logged a warning or an error, since those are passed via stderr.
				preprocessedPresetLines = preprocessOutput.stdout.split("\n");
			}
			catch (err) {
				console.error("An error occured while preprocessing this shader:\r\n", err);
				fs.writeFileSync(`./errors/preprocess_${path.basename(path.join(process.cwd(), ...folderArray), path.extname(path.join(process.cwd(), ...folderArray)))}_${currPreset.name.replace(/\W/g, "")}${vulkanSet == 0 ? ".vert" : ".frag"}`, presetChangedShader.join("\n"), {encoding: "utf8"});
				manualFixingShaders++;
				continue;
			}
			
			// Create preset replacements
			let textureBindingCounter = 0;
			let bufferBindingCounter = 0;
			let lastUfVariableLine = undefined;
			let ufVariableCrossOffList = [...ufVariablesOrder];
			let ufVariableShaderOrder = [];
			
			for (let i=0; i<shaderLines.length; i++) {
				let currLine = preprocessedPresetLines[i];
				
				// Create TEXTURE_LAYOUT preset replacement
				if (layoutTextureRegex.test(currLine)) {
					currPreset.shaderChanges[i] = currLine.replace(layoutTextureRegex, `TEXTURE_LAYOUT($1, ${vulkanSet}, ${textureBindingCounter}) `);
					textureBindingCounter++;
				}
				// Create UNIFORM_BUFFER_LAYOUT preset replacement
				if (layoutBufferRegex.test(currLine)) {
					currPreset.shaderChanges[i] = currLine.replace(layoutBufferRegex, `UNIFORM_BUFFER_LAYOUT($1, ${vulkanSet}, %BUFFER_BINDING_${bufferBindingCounter}%) `);
					bufferBindingCounter++;
				}
				
				// Collect and replace uf variables with blank lines
				if (uniformUfRegex.test(currLine)) {
					if (currPreset.ufBlockVariables.length == 0) {
						currPreset.shaderChanges[i] = "%FIRST_UF_VARIABLE_IN_PRESET%\r";
						lastUfVariableLine = i;
					}
					else {
						currPreset.shaderChanges[i] = `// ${currLine.match(uniformUfRegex)[3]} was moved to the ufBlock\r`;
						if (lastUfVariableLine != i-1 && consecutiveUfVariables) {
							lastUfVariableLine = i;
						}
						else {
							consecutiveUfVariables = false;
						}
					}
					currPreset.ufBlockVariables.push(currLine);
					
					if (!ufBlockLineIndexes.hasOwnProperty(currLine.match(uniformUfRegex)[3])) {
						ufBlockLineIndexes[currLine.match(uniformUfRegex)[3]] = [];
						allUfLines.push(currLine);
					}
					ufBlockLineIndexes[currLine.match(uniformUfRegex)[3]].push(i);
					let indexUfVariable = ufVariableCrossOffList.findIndex(ufVariableStart => currLine.match(uniformUfRegex)[3].startsWith(ufVariableStart));
					ufVariableShaderOrder.push(currLine.match(uniformUfRegex)[3]);
					if (indexUfVariable != -1) ufVariableCrossOffList.splice(0, indexUfVariable);
					else {
						shaderOutput.push(`This shader (with "${currPreset.name}" preset) doesn't follow the uf_* variable order from Cemu, which means that some uf_* variables could've been left-out or added.\r`);
					}
				}
				currPreset.textureBindingCounter = textureBindingCounter;
			}
		}

		// Sort the order of uf_variables
		let beforeOrder = [...allUfLines];

		function getSortRank(unit) {
			let currUfVariableName  = unit.match(uniformUfRegex)[3];
			for (var i = 0; i < ufVariablesOrder.length; i++) {
				if (currUfVariableName.startsWith(ufVariablesOrder[i])) {
					return i;
				}
			}
			return ufVariablesOrder.length;
		}

		allUfLines.sort(function(a, b){  
			return getSortRank(a) - getSortRank(b);
		});

		if (beforeOrder.toString() != allUfLines.toString()) {
			shaderOutput.push(`Since the uf_* variables that were encountered were incorrect, the conversion script has corrected them.\r`);
			shaderOutput.push(`Order found:\r\n${beforeOrder.join("\n")}`);
			shaderOutput.push(`Expected/fixed order:\r\n${allUfLines.join("\n")}`);
		}

		// Log some extra stuff
		if (!consecutiveUfVariables) {
			//shaderOutput.push("The uf_* variables weren't found to be consecutive, which means that someone probably messed with them.\r");
			// It seems that Cemu previously didn't insert all the uf_* variables consecutively.
			// It's not really that big of a deal anyway to move them in one block anyways, and shouldn't cause any issues due to the early inserted backup method.
		}

		if (allUfLines.length == 0) {
			shaderOutput.push("This shader doesn't seem to have any uf_* variables. This could mean that this shader was edited.\r");
		}

		// Check if unified ufBlock can be made
		let differingUfBlock = false;
		let ufBlockLineSize = undefined;
		for (let [ufVariableName, lineIndexes] of Object.entries(ufBlockLineIndexes)) {
			// Check if each ufBlock has the same amount of variables.
			let sameAmount = true;
			if (ufBlockLineSize == undefined) ufBlockLineSize = lineIndexes.length;
			else if (sameAmount) sameAmount = (ufBlockLineSize == lineIndexes.length);

			// Check if each uf variable is on the same lines.
			let sameLineIndexes = true;
			for (let i=0; i<lineIndexes.length; i++) {
				if (lineIndexes[i] != lineIndexes[0]) sameLineIndexes = false;
			}
			
			if (!sameAmount || !sameLineIndexes) {
				if (!sameAmount) shaderOutput.push("This shader doesn't have the same amount of uf_* variables for each preset.\r");
				else if (!sameLineIndexes) shaderOutput.push("This shader doesn't have the same line indexes for the uf_* variables. Hence why it might've been edited.\r");
				differingUfBlock = true;
				break;
			}
		}

		// Check if each preset has the same amount of texture bindings
		let textureBindingsAmount = undefined;
		sameTextureBindingsAmount = true;
		for (preset in rulesPresets) {
			if (textureBindingsAmount == undefined) textureBindingsAmount = rulesPresets[preset].textureBindingCounter;
			if (rulesPresets[preset].textureBindingCounter != textureBindingsAmount) {
				sameTextureBindingsAmount = false;
				break;
			}
		}

		// Cemu optimized some uf variables away at some point. So, it's commented in the ufBlock. But also disable the ufBlock creation when that was the only variable.
		let optimizedUfVariablesLength = 0;
		for (ufLine in allUfLines) {
			if (allUfLines[ufLine].split(" ")[2].split(";")[0].split("[")[0] == "uf_windowSpaceToClipSpaceTransform") continue;
			else optimizedUfVariablesLength++;
		}
		
		// Merge changes from each preset and insert placeholder text
		let inplaceUfBlock = !differingUfBlock && sameTextureBindingsAmount;

		if (!inplaceUfBlock && optimizedUfVariablesLength != 0) {
			shaderOutput.push("Due to one or more things mentioned above, this shader might be broken.\r");
			let newUfBlockLines = [];
			newUfBlockLines.push("#ifdef VULKAN\r");
			newUfBlockLines.push(`layout(set = ${vulkanSet}, binding = ${textureBindingsAmount}) uniform ufBlock\r`);
			newUfBlockLines.push("{\r");
			for (ufLine in allUfLines) {
				if (allUfLines[ufLine].split(" ")[2].split(";")[0].split("[")[0] == "uf_windowSpaceToClipSpaceTransform") {
					newUfBlockLines.push("// "+allUfLines[ufLine]+" // Cemu optimized this uf_variable away in Cemu 1.15.7\r");
				}
				else if (allUfLines[ufLine].split(" ")[2].split(";")[0].split("[")[0] == "uf_fragCoordScale") newUfBlockLines.push(allUfLines[ufLine].replace("vec2", "vec4"));
				else newUfBlockLines.push(allUfLines[ufLine]);
			}
			newUfBlockLines.push("};\r");
			newUfBlockLines.push("#else\r");
			for (ufLine in allUfLines) {
				if (allUfLines[ufLine].split(" ")[2].split(";")[0].split("[")[0] == "uf_windowSpaceToClipSpaceTransform") newUfBlockLines.push("// "+allUfLines[ufLine]+" // Cemu optimized this uf_variable away in Cemu 1.15.7\r");
				else newUfBlockLines.push(allUfLines[ufLine]);
			}
			newUfBlockLines.push("#endif\r");
			shaderLines[sharedUFBlockAlternativeLine] = newUfBlockLines.join("\n");
		}

		for (let i=0; i<shaderLines.length; i++) {
			let currLineChanges = [];
			for (preset in rulesPresets) {
				if (rulesPresets[preset].shaderChanges[i] != undefined) {
					// Replace placeholders
					let bufferBindingMatches = rulesPresets[preset].shaderChanges[i].match(/%BUFFER_BINDING_(\d)+%/);
					if (bufferBindingMatches != null) {
						currLineChanges.push(rulesPresets[preset].shaderChanges[i].replace(`%BUFFER_BINDING_${bufferBindingMatches[1]}%`, parseInt(bufferBindingMatches[1])+(allUfLines.length!=0)+rulesPresets[preset].textureBindingCounter));
					}
					else if (rulesPresets[preset].shaderChanges[i] == "%FIRST_UF_VARIABLE_IN_PRESET%\r") {
						if (inplaceUfBlock && optimizedUfVariablesLength != 0) {
							let newUfBlockLines = [];
							newUfBlockLines.push("#ifdef VULKAN\r");
							newUfBlockLines.push(`layout(set = ${vulkanSet}, binding = ${rulesPresets[preset].textureBindingCounter}) uniform ufBlock\r`);
							newUfBlockLines.push("{\r");
							for (ufLine in allUfLines) {
								if (allUfLines[ufLine].split(" ")[2].split(";")[0].split("[")[0] == "uf_fragCoordScale") newUfBlockLines.push(allUfLines[ufLine].replace("vec2", "vec4"));
								else if (allUfLines[ufLine].split(" ")[2].split(";")[0].split("[")[0] == "uf_windowSpaceToClipSpaceTransform") newUfBlockLines.push("// "+allUfLines[ufLine].trim()+" // Cemu optimized this uf_variable away in Cemu 1.15.7\r");
								else newUfBlockLines.push(allUfLines[ufLine]);
							}
							newUfBlockLines.push("};\r");
							newUfBlockLines.push("#else\r");
							for (ufLine in allUfLines) {
								if (allUfLines[ufLine].split(" ")[2].split(";")[0].split("[")[0] == "uf_windowSpaceToClipSpaceTransform") newUfBlockLines.push("// "+allUfLines[ufLine].trim()+" // Cemu optimized this uf_variable away in Cemu 1.15.7\r");
								else newUfBlockLines.push(allUfLines[ufLine]);
							}
							newUfBlockLines.push("#endif\r");
							currLineChanges.push(newUfBlockLines.join("\n"));
						}
						else currLineChanges.push("\r");
					}
					else currLineChanges.push(rulesPresets[preset].shaderChanges[i]);
				}
			}

			if (currLineChanges.length == 0) continue;
			else if (currLineChanges.length == 1) shaderLines[i] = currLineChanges[0];
			else {
				let conflictingLineChanges = [];
				for (change in currLineChanges) {
					if (!conflictingLineChanges.includes(currLineChanges[change])) conflictingLineChanges.push(currLineChanges[change]);
				}
				if (conflictingLineChanges.length > 1) {
					shaderOutput.push(`Encountered a conflict between lines. Probably will end-up in a broken shader. Conflicts: ${conflictingLineChanges.toString()}\r`);
				}
				shaderLines[i] = conflictingLineChanges[0];
			}
		}
	}

	// Insert shader output into shader output
	if (verboseOutput) shaderLines.splice(shaderLines.findIndex(line => line === "%CONVERSION_OUTPUT%\r"), 1, ...shaderOutput);
	if (shaderOutput.length != 0) console.error("Encountered a few warnings in this shader "+path.join(process.cwd(), ...folderArray)+":\r\n", shaderOutput);

	shaderLines = shaderLines.join("\n").replace(/(UNIFORM_BUFFER_LAYOUT\(\d+,[ ]*\d+,[ ]*\d+\)[ ]*)\r*\n+(uniform[ ]+[a-zA-Z0-9_]+)/g, "$1$2").split("\n");

	// Third (testing) pass
	{
		for (preset in rulesPresets) {
			let currPreset = rulesPresets[preset];
			
			// Replace values from this preset variable, if there are any.
			let presetChangedShader = [];
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
				
				presetChangedShader.push(currLine);
			}
			
			// Compile final shader with OpenGL
			try {
				let preprocessOutput = child_process.spawnSync("glslangValidator.exe", ["--stdin"/*Pass shader via stdin instead of having to write a file*/, "-S "+(vulkanSet == 0 ? "vert" : "frag")/*Whether shader is a vertex or fragment shader*/], {encoding: "utf8", shell: true, input: presetChangedShader.join("\n")});
				if (preprocessOutput.stderr.trim() != "") throw preprocessOutput.stderr; // Throw an error if glslangValidator logged a warning or an error, since those are passed via stderr.
				if (preprocessOutput.output[1] != "stdin\r\n" && preprocessOutput.output[1].trim() != "") throw preprocessOutput.output[1];
			}
			catch (err) {
				console.error("An error occured while compiling the V4 shader with OpenGL:\r\n", err);
				fs.writeFileSync(`./errors/OpenGLTesting_${path.basename(path.join(process.cwd(), ...folderArray), path.extname(path.join(process.cwd(), ...folderArray)))}_${currPreset.name.replace(/\W/g, "")}${vulkanSet == 0 ? ".vert" : ".frag"}`, presetChangedShader.join("\n"), {encoding: "utf8"});
				manualFixingShaders++;
				continue;
			}

			// Compile final shader with Vulkan
			try {
				let preprocessOutput = child_process.spawnSync("glslangValidator.exe", ["--stdin"/*Pass shader via stdin instead of having to write a file*/, "--client vulkan100"/*Use Vulkan*/, "-S "+(vulkanSet == 0 ? "vert" : "frag")/*Whether shader is a vertex or fragment shader*/], {encoding: "utf8", shell: true, input: presetChangedShader.join("\n")});
				if (preprocessOutput.stderr.trim() != "") throw preprocessOutput.stderr; // Throw an error if glslangValidator logged a warning or an error, since those are passed via stderr.
				if (preprocessOutput.output[1] != "stdin\r\n" && preprocessOutput.output[1].trim() != "") throw preprocessOutput.output[1];
			}
			catch (err) {
				console.error("An error occured while compiling the V4 shader with Vulkan:\r\n", err);
				fs.writeFileSync(`./errors/VulkanTesting_${path.basename(path.join(process.cwd(), ...folderArray), path.extname(path.join(process.cwd(), ...folderArray)))}_${currPreset.name.replace(/\W/g, "")}${vulkanSet == 0 ? ".vert" : ".frag"}`, presetChangedShader.join("\n"), {encoding: "utf8"});
				manualFixingShaders++;
				continue;
			}
			process.stdout.clearLine();
			process.stdout.write(`Testing presets: ${(((preset)/(rulesPresets.length-1))*100).toFixed().padStart(2, " ")}% has been compiled.\r`);
		}
		process.stdout.clearLine();
	}

	// Write to file
	fs.writeFileSync(path.join(process.cwd(), ...folderArray), shaderLines.join("\n"));
}

function convertPack(convertFiles, folderArray) {
	if (convertFiles.shaders.length == 0) {
		//console.log("This graphic pack doesn't have any shaders so we can just copy all the files!");
	}
	
	let [prevUsedVersion, rulesPresets] = convertRules(convertFiles.rulesText, path.join(process.cwd(), "graphicPacks", ...folderArray, "rules.txt"));
	
	for (otherFile in convertFiles.otherFiles) {
		//console.debug("Copying unrelated file to the new directory "+srcFolder+convertFiles.otherFiles[otherFile]+"...");
		fs.copyFileSync(path.join(process.cwd(), ...folderArray, convertFiles.otherFiles[otherFile]), path.join(process.cwd(), "graphicPacks", ...folderArray, convertFiles.otherFiles[otherFile]));
	}
	
	if (prevUsedVersion == 3) {
		for (shader in convertFiles.shaders) {
			convertShader(convertFiles.shaders[shader].shaderText, rulesPresets, ["graphicPacks", ...folderArray, convertFiles.shaders[shader].name], convertFiles.shaders[shader].vulkanSet);
		}
	}
	else if (prevUsedVersion == 4 && convertFiles.shaders.length != 0) {
		console.info("The shaders in this graphic pack are already ported, so just copy all the files...");
		for (shader in convertFiles.shaders) {
			fs.copyFileSync(path.join(process.cwd(), ...folderArray, convertFiles.shaders[shader].name), path.join(process.cwd(), "graphicPacks", ...folderArray, convertFiles.shaders[shader].name));
		}
	}
	
	if (prevUsedVersion == undefined) console.warn("Why does this rules.txt file have no version?");
}

function convertFolder(folderPathArray) {
	let dirEntries = fs.readdirSync(path.join(process.cwd(), ...folderPathArray), {withFileTypes: true});
	if (fs.existsSync(path.join(process.cwd(), "/graphicPacks/", ...folderPathArray))) fs.rmdirSync(path.join(process.cwd(), "/graphicPacks/", ...folderPathArray), {recursive: true});
	fs.mkdirSync(path.join(process.cwd(), "/graphicPacks/", ...folderPathArray), {recursive: true});
	
	for (let entry in dirEntries) {
		if (dirEntries[entry].isDirectory()) {
			// Check for folder entries and see if there's a rules.txt file.
			let packFiles = fs.readdirSync(path.join(process.cwd(), ...folderPathArray, dirEntries[entry].name), {withFileTypes: true});
			
			if (filterFolderNames.length != 0) {
				let filtered = true;
				for (name in filterFolderNames) {
					if (dirEntries[entry].name.toLowerCase().startsWith(filterFolderNames[name].toLowerCase())) filtered = false;
				}
				if (filtered) continue;
			}

			console.group("Converting "+path.join(process.cwd(), ...folderPathArray, dirEntries[entry].name)+" to "+path.join(process.cwd(), "/graphicPacks/", ...folderPathArray, dirEntries[entry].name)+"...");
			
			let convertFiles = {rulesText: undefined, shaders: [], otherFiles: []};
			for (file in packFiles) {
				if (packFiles[file].isFile() && packFiles[file].name == "rules.txt") {
					convertFiles.rulesText = fs.readFileSync(path.join(process.cwd(), ...folderPathArray, dirEntries[entry].name, "rules.txt"), {encoding: "utf8"});
				}
				else if (packFiles[file].isFile() && packFiles[file].name.length >= "0000000000000000_0000000000000000_xx.txt".length) {
					if (/^[a-zA-Z0-9]{16}_[\w]{16}_[p|v]s/.test(packFiles[file].name)) {
						convertFiles.shaders.push({name: packFiles[file].name, shaderText: fs.readFileSync(path.join(process.cwd(), ...folderPathArray, dirEntries[entry].name, packFiles[file].name), {encoding: "utf8"}), vulkanSet: ((packFiles[file].name.substr(34, 2) == "vs") ? 0 : 1)});
					}
					else {
						convertFiles.otherFiles.push(packFiles[file].name);
						//console.debug("Why does "+path+dirEntries[entry].name+"/ have "+packFiles[file].name+" as a disabled shader? Can this file be deleted?");
					}
				}
				else if (packFiles[file].isFile() && (packFiles[file].name == "patches.txt" || packFiles[file].name == "output.glsl")) {
					convertFiles.otherFiles.push(packFiles[file].name);
				}
				else if (packFiles[file].isDirectory()) {
					//console.debug("Why does "+path+dirEntries[entry].name+"/ have a folder called "+packFiles[file].name+".");
					fs.mkdirSync(path.join(process.cwd(), "/graphicPacks/", ...folderPathArray, dirEntries[entry].name), {recursive: true});
					convertFolder([...folderPathArray, dirEntries[entry].name]);
					break;
				}
				else if (packFiles[file].isFile()) {
					//console.debug("Why does "+dirEntries[entry].name+"/ have a random file called "+packFiles[file].name+"? Is this one necessary?");
					convertFiles.otherFiles.push(packFiles[file].name);
				}
			}
			
			if (convertFiles.rulesText == undefined) {
				//console.warn("Why does "+dirEntries[entry].name+" not have a rules.txt file?");
				console.groupEnd();
				continue;
			}
			
			fs.mkdirSync(path.join(process.cwd(), "/graphicPacks/", ...folderPathArray, dirEntries[entry].name), {recursive: true});
			convertPack(convertFiles, [...folderPathArray, dirEntries[entry].name], ["/graphicPacks/", ...folderPathArray, dirEntries[entry].name]);
			console.groupEnd();
		}
	}
}

// Configuration
const filterFolderNames = ["BreathOfTheWild"];
const verboseOutput = false;


if (fs.existsSync(path.join(process.cwd(), "/errors/"))) fs.rmdirSync(path.join(process.cwd(), "/errors/"), {recursive: true});
fs.mkdirSync(path.join(process.cwd(), "/errors/"));

console.group("Convert shaders from Filters...");
convertFolder(["Filters"]);
console.groupEnd();

console.group("Convert shaders from Enhancements...");
convertFolder(["Enhancements"]);
console.groupEnd();

console.group("Convert shaders from Resolutions...");
convertFolder(["Resolutions"]);
console.groupEnd();

console.group("Convert shaders from Mods...");
convertFolder(["Mods"]);
console.groupEnd();

console.group("Convert shaders from Workarounds...");
convertFolder(["Workarounds"]);
console.groupEnd();

if (fs.existsSync("./preprocessed-shader.temp")) fs.unlinkSync("./preprocessed-shader.temp");
if (fs.existsSync("./frag.spv")) fs.unlinkSync("./frag.spv");
if (fs.existsSync("./vert.spv")) fs.unlinkSync("./vert.spv");

console.log(manualFixingShaders+" shaders need to be fixed manually and "+manualCheckingShaders+" shaders need to be checked, see the output above.");
