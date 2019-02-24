------
### TLoZ Wind Waker HD 
------
There are some issues with AO and light sources, to mitigate this some “sub” viewports ned to scale evenly. XCX uses a similar approach to get smooth shadow transitions. 

Example:
[Preset]
name = 3440x1440 (21:9)
$width = 3440
$height = 1440
$gameWidth= 1920
$gameHeight= 1080
$lightSource = 1.5
$scaleShader = (2560.0/3440.0)
$aspectRatio = (43.0/18.0)

Base resolution is 2560x1440 -> Uw patch res 3440
AO needs to be 2160  = 1440 * $lightSource = 1.5
We then need to scale back ultrawide to original aspect for all viewports using AO / light sources
2560 = 3440 *$scaleShader  (2560.0/3440.0)  

All AO shader scaling has also been removed, currently they break more than they fix.. 
