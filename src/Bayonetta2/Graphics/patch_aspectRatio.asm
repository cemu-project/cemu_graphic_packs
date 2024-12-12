[Bayonetta2_AspectRatio]
moduleMatches = 0xAF5D1A85, 0xCCB72156 ; (EU/NA/JP), demo(EU/NA)
.origin = codecave

widthScaleRatio:
.float $width
heightScaleRatio:
.float $height

_calculateARForRendering:
lis r7, widthScaleRatio@ha
lfs f13, widthScaleRatio@l(r7)
lis r7, heightScaleRatio@ha
lfs f31, heightScaleRatio@l(r7)
fdivs f2, f13, f31
blr

_calculateARForCulling:
lis r7, widthScaleRatio@ha
lfs f13, widthScaleRatio@l(r7)
lis r7, heightScaleRatio@ha
lfs f1, heightScaleRatio@l(r7)
fdivs f10, f13, f1
blr

[Bayonetta2_AspectRatio_]
moduleMatches = 0xAF5D1A85 ; (EU/NA/JP)
0x032F2E6C = bla _calculateARForRendering
0x032F2044 = bla _calculateARForCulling

[Bayonetta2_AspectRatio_vDemo]
moduleMatches = 0xCCB72156 ; demo(EU/NA)
0x031621C0 = bla _calculateARForRendering
0x03161398 = bla _calculateARForCulling
