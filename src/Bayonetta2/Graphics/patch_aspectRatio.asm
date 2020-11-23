[Bayo2_AspectRatio_V0]
moduleMatches = 0xAF5D1A85

.origin = codecave
_widthScaleRatio:
.float $width
_heightScaleRatio:
.float $height

_calculateARForRendering:
lis r7, _widthScaleRatio@ha
lfs f13, _widthScaleRatio@l(r7)
lis r7, _heightScaleRatio@ha
lfs f31, _heightScaleRatio@l(r7)
fdivs f2, f13, f31
blr

_calculateARForCulling:
lis r7, _widthScaleRatio@ha
lfs f13, _widthScaleRatio@l(r7)
lis r7, _heightScaleRatio@ha
lfs f1, _heightScaleRatio@l(r7)
fdivs f10, f13, f1
blr

0x032F2E6C = bla _calculateARForRendering
0x032F2044 = bla _calculateARForCulling
