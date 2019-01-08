---
anchor_link: customize-packs
order: 99
---
This might be slightly technical, so carefully follow these steps. This'll assume you use Cemu 1.14.0 packs and newer since only those contain presets.

1. Open the resolution pack folder (either `graphicPacks` or `graphicPacks/downloadedGraphicPacks`) which follows the following name convention `ShortTitle_Resolution`, for example `MarioKart8_Resolution`.
2. Open the `rules.txt` file in notepad or something similar and find the following text (this is for 720p games, but 1080p will only have some changes in values):

[Preset]  
name = 1280x720 (Default)  
$width = 1280  
$height = 720  
$gameWidth = 1280  
$gameHeight = 720  

3. Now, change the `$width` and `$height` to the resolution you want. Some resolutions won't work so choosing common monitor resolutions here is recommended.
An extra step is needed if you've used Cemu's build-in downloader: Copy the pack you've edited from the `graphicPacks/downloadedGraphicPacks` folder to the root `graphicPacks` folder to prevent it from being overwritten.
4. Choose the "(Default)" preset (the one you've edited) in the graphicPacks window and boot the game up. If it has any issues, follow the steps again and try a different resolution.