[SonicBoom_DisableHUD_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip flag override in BRB_HUDManager::HUD_Enable if second argument is not zero
0x0306EA78 = nop
; Skip BigRedButton::subtitle_show
0x0307C4B0 = blr
; Skip CBrbAICompanion::show_picon
0x031FEF34 = blr
; Skip CbrbObjectiveMarker::Enable
0x0331BCE4 = blr

[SonicBoom_DisableHUD_JP]
moduleMatches = 0x0D395735 ; (JP)
0x0306E82C = nop
0x0307C1EC = blr
0x031FEEF8 = blr
0x0331BC08 = blr

[SonicBoom_DisableHUD_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x0306E98C = nop
0x0307C270 = blr
0x031FED4C = blr
0x0331B924 = blr

[SonicBoom_DisableHUD_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x0306E9AC = nop
0x0307C290 = blr
0x031FECB4 = blr
0x0331B88C = blr

[SonicBoom_DisableHUD_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
0x0306e704 = nop
0x0307c0b4 = blr
0x031fec40 = blr
0x0331b8d8 = blr

[SonicBoom_DisableHUD_JPvDemo]
moduleMatches = 0x62EBE136 ; demo(JP)
0x0306e71c = nop
0x0307c0cc = blr
0x031fedd8 = blr
0x0331bae8 = blr
