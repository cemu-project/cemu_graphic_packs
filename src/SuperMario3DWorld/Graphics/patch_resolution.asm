[SuperMario3DWorld_AspectRatio]
moduleMatches = 0xD2308838, 0xBBAF1908, 0xEB70C731 ; (EU), (NA), (JP)
; rodata constants
0x10363ED4 = .float $width/$height
0x1036A688 = .float $width/$height
_aspectAddr = 0x10363ED4

; Aspect calculation
0x0241D9B4 = lis r8, _aspectAddr@ha
0x0241D9B8 = lfs f0, _aspectAddr@l(r8)

; touch position fix
0x0241D9D4 = lis r8, _aspectAddr@ha
0x0241D9D8 = lfs f0, _aspectAddr@l(r8)
