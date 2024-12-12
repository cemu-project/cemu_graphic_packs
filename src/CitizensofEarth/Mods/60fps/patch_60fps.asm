[CitizensEarth_60fps]
moduleMatches = 0xB87B357B ; (EU/NA)
.origin = codecave

; location where .float 0.0166666.. can be found in memory
_FrameRate = 0x100A151C

; Load 60 into f0 register
_60fps:
lis   r12,_FrameRate@h
lfs   f0,_FrameRate@l(r12)
blr

0x021DE6C8 = bla _60fps
