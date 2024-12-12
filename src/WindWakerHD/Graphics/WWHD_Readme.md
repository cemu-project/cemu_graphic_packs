------
### TLoZ Wind Waker HD 
------
### Graphic options 
3840x4320 vert x2 SSAA - light res x2

3840x4320 vert x2 SSAA - Runs the game at double vertical res balancing look and performance when super sampling. Aspect is still 16:9 so run full screen scaling in stretched and bilinear when activating this option. 

Light res x2 - Doubles resolution of light sources and mitigate light haloing around object edges. 

### Nice to know when creating a custom resolution 

There are some issues with AO and light sources, to mitigate this some “sub” viewports need to scale evenly. XCX uses a similar approach to get smooth shadow transitions. 

Example:
```
[Preset]
name = 3440x1440 (21:9)
$width = 3440
$height = 1440
$gameWidth= 1920
$gameHeight= 1080
$lightSource = 1.5
$scaleShader = (2560.0/3440.0)
$aspectRatio = (43.0/18.0)
```

Base resolution is 2560x1440 -> Uw patch res 3440

AO needs to be 2160  = 1440 * $lightSource = 1.5

We then need to scale back ultrawide to original aspect for all viewports using AO / light sources

2560 = 3440 *$scaleShader  (2560.0/3440.0)  

```
[TextureRedefine]
width = 1024
height = 544
formats = 0x001
overwriteWidth = ($width/$gameWidth) * (1024*$lightSource*$scaleShader)
overwriteHeight = ($height/$gameHeight) * (544*$lightSource)
```
