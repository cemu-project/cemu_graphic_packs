[SonicBoom_SSAO_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip SSAO parameter call
0x02E966E4 = b 0x02E96720

[SonicBoom_SSAO_JP]
moduleMatches = 0x0D395735 ; (JP)
0x02E96448 = b 0x02E96484

[SonicBoom_SSAO_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x02E9668C = b 0x02E966C8

[SonicBoom_SSAO_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x02E966AC = b 0x02E966E8

[SonicBoom_SSAO_vDemo]
moduleMatches = 0xF8B127C5, 0x62EBE136 ; demo(EU/NA), demo(JP)
0x02E96328 = b 0x02E96364
