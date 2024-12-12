[MarioSonicRio2016_AspectRatio]
moduleMatches = 0xD44C22E3, 0xE0E2BBA7, 0x60481B3F ; (EU/NA), (JP), demo(EU/JP)
.origin = codecave

width:
.float $width
height:
.float $height

_aspectRatio:
; Scale the width of the viewport that it wants to calculate the ratio for
lis r13, width@ha
lfs f12, width@l(r13)
fsub f12, f12, f14
; Scale the height of the viewport that it wants to calculate the ratio for
lis r14, height@ha
lfs f13, height@l(r14)
fsub f0, f13, f0
; Original instruction that got replaced by the code cave jump, which divides the width and height to get the aspect ratio, then return to original code
fdivs f1, f12, f13
blr

[MarioSonicRio2016_AspectRatio_]
moduleMatches = 0xD44C22E3, 0xE0E2BBA7 ; (EU/NA), (JP)
0x0256975C = bla _aspectRatio ; Modify this instruction to go to the code cave which scales the height and width to the upscale ratios

[MarioSonicRio2016_AspectRatio_vDemo]
moduleMatches = 0x60481B3F ; demo(EU/JP)
0x02566574 = bla _aspectRatio
