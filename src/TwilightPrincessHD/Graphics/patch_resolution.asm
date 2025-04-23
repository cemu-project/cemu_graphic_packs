[TwilightPrincessHD_Resolution]
moduleMatches = 0x1A03E108, 0xA3175EEA ; v81(EU/NA), v82(JP)
0x1005AAD8 = .float $aspectRatio
_aspectAddr = 0x1006AAD8
0x028D75B8 = lis r11, _aspectAddr@h
0x028D75C0 = lfs f0, _aspectAddr@l(r11) ; Main 3d Aspect
0x029BB184 = lis r12, _aspectAddr@h
0x029BB188 = lfs f2, _aspectAddr@l(r12) ; may just be the intro zelda graphic
