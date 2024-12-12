[XCX_Aspect]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9, 0x8780C48F ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J, 1.0.1J
.origin = codecave

widthScaleRatio:
.float ($width/$gameWidth)
heightScaleRatio:
.float ($height/$gameHeight)

_aspectChangeCave:
; Scale the width of the viewport that it wants to calculate the ratio for
lis r7, widthScaleRatio@ha
lfs f8, widthScaleRatio@l(r7)
fmuls f13, f13, f8
; Scale the height of the viewport that it wants to calculate the ratio for
lis r7, heightScaleRatio@ha
lfs f8, heightScaleRatio@l(r7)
fmuls f9, f9, f8

fdivs f13, f13, f9 ; Original instruction that got replaced by the code cave jump, which divides the width and height to get the aspect ratio
blr ; Return to the original code

[XCX_Aspect_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x03160AE8 = bla _aspectChangeCave ; Modify this instruction to go to the code cave which scales the height and width to the upscale ratios
0x1003E754 = .float ($width/$height) ; Modify constant that has a ratio in the code

[XCX_Aspect_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x03160A68 = bla _aspectChangeCave
0x1003E754 = .float ($width/$height)

[XCX_Aspect_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x0315BE80 = bla _aspectChangeCave
0x1003E714 = .float ($width/$height)

[XCX_Aspect_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x031608E8 = bla _aspectChangeCave
0x1003E754 = .float ($width/$height)

[XCX_Aspect_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x03156880 = bla _aspectChangeCave
0x1003E6C4 = .float ($width/$height)

[XCX_Aspect_V101J]
moduleMatches = 0x8780C48F ; 1.0.1J
0x0315BBA8 = bla _aspectChangeCave
0x1003E714 = .float ($width/$height)
