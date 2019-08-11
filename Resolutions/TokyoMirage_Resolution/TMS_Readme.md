------
### Tokyo mirage sessions FE #  
------
### Graphic options 

3840x4320 vert x2 SSAA - Runs the game at double vertical res balancing look and performance when super sampling. Aspect is still 16:9 so run full screen scaling in stretched and bilinear when activating this option. 
By default game scales GUI and pillar boxes video. 


Example:
```
[Preset]
name = 2560x2160 ("21:9")  
$width = 2560
$height = 2160  <- double vertical res
$gameWidth = 1280
$gameHeight = 720
$UIAspectX = (1280.0/720.0) / (2560.0 / 1080.0) <- UI aspect 21:9 scale
$UIAspectY = 1.0
$GameAspect = (2560.0 / 1080.0)  <- 3d aspect 21:9 scale
```


Known issues Cemu 15:11.x
Shadows are broken
Touchpad seonsor aspect doesnt scale ie 21:9 graphics still has 16:9 sensor size 
Portraits are missing due to gfx pack scaling similar values in-game 
