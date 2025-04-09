[CaptainToad_Resolution_v16]
moduleMatches = 0x1B377483, 0x9E0461E7, 0x0576A725 ; v16(EU), v16(NA), v16(JP)
;rodata constants
0x0100A2D38 = .float $width/$height
0x0100C0164 = .float $width/$height
0x0100D982C = .float $width/$height
_aspectAddr = 0x0100A2D38

;Aspect Calculation
0x02373530 = lis r31, _aspectAddr@ha
0x02373534 = lfs f13, _aspectAddr@l(r31)

[CaptainToad_Resolution_v0]
moduleMatches = 0xC64B0A12, 0x43781F76, 0xD80AD9B4 ; v1(EU), v1(NA), v1(JP)
;rodata constants
0x100A0EE0 = .float $width/$height
0x100BE2EC = .float $width/$height
0x100D79B4 = .float $width/$height
_aspectAddr = 0x100A0EE0

;Aspect Calculation
0x02368158 = lis r31, _aspectAddr@ha
0x0236815C = lfs f13, _aspectAddr@l(r31)
