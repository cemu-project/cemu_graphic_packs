// Download latest version

fetch("https://api.github.com/repos/slashiee/cemu_graphic_packs/releases/latest").then(fetchRes => fetchRes.json()).then(fetchJson => {
	console.debug("Fetched releases from github...");
	document.getElementById("primary_download").href = fetchJson.assets[0].browser_download_url;
	return;
}).catch(fetchErr => {
	console.error("Seems like something isn't working...", fetchErr);
});

// Search Supported Games

var supportedGames = undefined;
var supportedGamesSearchSet = undefined;
var supportedGamesSearchSetHalfTitles = {};

const altNames = {
	"botw": "The Legend of Zelda: Breath of the Wild",
	"hw": "Hyrule Warriors",
	"smm": "Super Mario Maker",
	"mk8": "Mario Kart 8",
	"tphd": "The Legend of Zelda: Twilight Princess HD",
	"wwhd": "The Legend of Zelda: The Wind Waker HD",
	"breath of the dicknut": "The Legend of Zelda: Breath of the Wild"
};

async function searchSupportedGames(searchString) {
	document.getElementById("supported-games-search").classList.add("loading");
	document.getElementById("supported-games-search-results").innerHTML = "";
	
	if (!supportedGames) {
		supportedGames = true;
		await fetch((window.location.origin+window.location.pathname)+"/supported_titles.json", {cache: "no-store"}).then(fetchRes => fetchRes.json()).then(fetchJson => {
			console.debug("Fetched supported titles from '/supported_titles.json'.");
			supportedGames = fetchJson;
			supportedGamesSearchSet = FuzzySet([], false, 2, 3);
			for (supportedGame in supportedGames) {
				supportedGamesSearchSet.add(supportedGame);
			}
			return;
		}).catch(fetchErr => {
			console.error("Seems like something bad happened!", fetchErr);
		});
	}
	if (supportedGames === true) return; // Fix race errors with input
	
	if (Object.keys(altNames).includes(searchString.toLowerCase())) searchString = altNames[searchString.toLowerCase()];
	resultsHintSearch = supportedGamesSearchSet.get(searchString);
	
	if (resultsHintSearch != undefined && resultsHintSearch != null) { 
		for (let i=0; i<resultsHintSearch.length; i++) {
			let currResult = resultsHintSearch[i][1];
			
			let searchResultEntry = document.createElement("li");
			let gameTitleText = document.createTextNode(currResult);
			let versionBadge = document.createElement("span");
			let versionBadgeText = document.createTextNode(supportedGames[currResult].version3 ? "Latest Cemu version" : "Only supported on version 2");
			let resolutionBadge = document.createElement("span");
			let resolutionBadgeText = document.createTextNode(supportedGames[currResult].nativeRes+"p");
			
			searchResultEntry.className = "list-group-item list-group-item-action";
			versionBadge.className = "badge badge-light ml-2";
			resolutionBadge.className = "badge badge-pill badge-primary float-right";
			
			searchResultEntry.onclick=searchInfoModalTrigger
			if (supportedGames[currResult].version3) {
				searchResultEntry.classList.add("list-group-item-primary");
			}
			else {
				searchResultEntry.classList.add("list-group-item-secondary");
			}
			
			searchResultEntry.appendChild(gameTitleText);
			versionBadge.appendChild(versionBadgeText);
			searchResultEntry.appendChild(versionBadge);
			resolutionBadge.appendChild(resolutionBadgeText);
			searchResultEntry.appendChild(resolutionBadge);
			document.getElementById("supported-games-search-results").appendChild(searchResultEntry);
		}
	}
	
	
	document.getElementById("supported-games-search").classList.remove("loading");
}

async function searchInfoModalTrigger(clickedElem) {
	$("#searchInfoModal").modal(); // Initiate animation
	let clickedGame = clickedElem.target.firstChild.textContent;
	
	// Reset Compat Information
	document.getElementById("modal-preview-image").src="/assets/images/no-cover-available.png";
	document.getElementById("information-box").className="compat-status-loading";
	
	document.getElementById("gameTitle").innerText=clickedGame;
	document.getElementById("compatWikiButton").href=supportedGames[clickedGame].compatLink;
	document.getElementById("nativeResolution").textContent=supportedGames[clickedGame].nativeRes;
	document.getElementById("information-box").classList.add(supportedGames[clickedGame].version3 ? "version-3-supported" : "version-3-unsupported");
	document.getElementById("information-box").classList.add(supportedGames[clickedGame].hasUltrawide ? "ultrawide-supported" : "ultrawide-unsupported");
	
	if (supportedGames[clickedGame].hasOwnProperty("compatLink")) {
		await fetch(`https://cors-anywhere.herokuapp.com/http://compat.cemu.info/w/api?action=parse&page=${supportedGames[clickedGame].compatLink.split("http://compat.cemu.info/wiki/")[1]}&redirects=true&prop=parsetree&format=json`).then(fetchRes => fetchRes.json()).then(fetchJson => {
			console.debug(`Fetched ${clickedGame}'s(=${supportedGames[clickedGame].compatLink.split("http://compat.cemu.info/wiki/")[1]}) compat wiki`, fetchJson);
			let compatTemplates = new DOMParser().parseFromString(fetchJson.parse.parsetree["*"], "application/xml").documentElement.getElementsByTagName("template");
			let compatJson = [];
			
			for (let i=0; i<compatTemplates.length; i++) {
				if (compatTemplates[i].firstChild.textContent.includes("Infobox VG")) {
					let infoboxParts = compatTemplates[i].getElementsByTagName("name");
					for (let j=0; j<infoboxParts.length; j++) {
						compatJson[infoboxParts[j].textContent.trim()] = infoboxParts[j].nextElementSibling.textContent.trim();
					}
					break;
				}
			}
			
			console.debug("Parsed compat info...", compatJson)
			
			if (!compatJson.image.includes("*.jpg")) {
				document.getElementById("modal-preview-image").src="http://compat.cemu.info/wiki/Special:Redirect/file/"+compatJson.image.split("File:")[1].split("|")[0];
			}
			document.getElementById("information-box").classList.remove("compat-status-loading");
			document.getElementById("information-box").classList.add("compat-status-"+compatJson.rating.toLowerCase());
		});
	}
	
	$("#searchInfoModal").modal();
}

// searchSupportedGames(document.querySelector("#supported-games-search input.form-control").value); // If a user loads the page, execute the search inmediately. Initially meant so that if you'd return to the page and still had a search term, it would look correct.
document.querySelector("#supported-games-search input.form-control").value = ""; // Don't fetch stuff automatically when the user doesn't want to search. Considered better since it's an optional feature.
timeago().render(document.querySelectorAll('.commit-time'));