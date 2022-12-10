[unisonAspectRatio]
moduleMatches = 0xD44C22E3

.origin = codecave

_width:
.float $width

_height:
.float $height

_aspectRatio:
; Scale the width of the viewport that it wants to calculate the ratio for
lis r13, _width@ha
lfs f12, _width@l(r13)
fsub f12, f12, f14
; Scale the height of the viewport that it wants to calculate the ratio for
lis r14, _height@ha
lfs f13, _height@l(r14)
fsub f0, f13, f0
; Original instruction that got replaced by the code cave jump, which divides the width and height to get the aspect ratio, then return to original code
fdivs f1, f12, f13
blr

0x0256975C = bla _aspectRatio ; Modify this instruction to go to the code cave which scales the height and width to the upscale ratios