[SonicBoom_PauseStateFix_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip CBrbAICompanion::ForceIdle subroutine
0x0306EDBC = nop

[SonicBoom_PauseStateFix_JP]
moduleMatches = 0x0D395735 ; (JP)
0x0306EA30 = nop

[SonicBoom_PauseStateFix_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x0306EB80 = nop

[SonicBoom_PauseStateFix_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x0306EBA0 = nop

[SonicBoom_PauseStateFix_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
0x0306e8f8 = nop

[SonicBoom_PauseStateFix_JPvDemo]
moduleMatches = 0x62EBE136 ; demo(JP)
0x0306e910 = nop
