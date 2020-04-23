[Bayo2USv0] #v5 asm
moduleMatches = 0xAF5D1A85

.origin = codecave all 
_widthScaleRatio:
.float $width
_heightScaleRatio:
.float $height   

_Cave:
lis r7, _widthScaleRatio@ha
lfs f13, _widthScaleRatio@l(r7)
lis r7, _heightScaleRatio@ha
lfs f31, _heightScaleRatio@l(r7)

fdivs f2, f13, f31
blr


0x032F2E6C = bla _Cave  
0x032F2044 = bla _Cave                                 
0x032F207C = bla _Cave                                 
0x032F2084 = bla _Cave                                 
