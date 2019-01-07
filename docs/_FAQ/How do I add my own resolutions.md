---
anchor_link: customize-packs
order: 99
---
This might be slightly technical, so carefully follow these steps.

If you use the build-in downloader, follow the extra steps in this guide. If you use the manual installation, just skip those steps.

1. Open the resolution pack folder, which follows the following name convention `ShortTitle_Resolution`, for example `MarioKart8_Resolution`.
2. Open the `rules.txt` file in notepad or something similar and find the following text (this is for 720p games, but 1080p will only have some changes in values):

[Preset]  
name = 1280x720 (Default)  
$width = 1280  
$height = 720  
$gameWidth = 1280  
$gameHeight = 720  

3. Now, change the `$width` and `$height` to the resolution you want and pick the default preset!

**Though, graphic packs and some resolutions aren't compatible so choosing common monitor resolutions is recommended.**