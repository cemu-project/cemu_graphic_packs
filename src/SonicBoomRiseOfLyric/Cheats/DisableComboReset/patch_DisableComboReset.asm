[SonicBoom_DisableComboReset_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip BRBCharacter::ResetCombo
0x0323CCA0 = blr

[SonicBoom_DisableComboReset_JP]
moduleMatches = 0x0D395735 ; (JP)
0x0323CBB0 = blr

[SonicBoom_DisableComboReset_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x0323C920 = blr

[SonicBoom_DisableComboReset_NAv0]
moduleMatches = 0x90DAC5CE ;v0(NA)
0x0323C888 = blr

[SonicBoom_DisableComboReset_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
0x0323C874 = blr

[SonicBoom_DisableComboReset_JPvDemo]
moduleMatches = 0x62EBE136 ; demo(JP)
0x0323CA90 = blr
