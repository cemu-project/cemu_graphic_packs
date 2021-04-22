[WiiULauncher0US]
moduleMatches = 0x90DAC5CE

; Skip flag override in BRB_HUDManager::HUD_Enable if second argument is not zero
0x306E9AC = nop

; Skip BigRedButton::subtitle_show
0x307C290 = blr

; Skip CBrbAICompanion::show_picon
0x31FECB4 = blr

; Skip CbrbObjectiveMarker::Enable
0x331B88C = blr

[WiiULauncher0EU]
moduleMatches = 0x8F7D2702

; Skip flag override in BRB_HUDManager::HUD_Enable if second argument is not zero
0x306E98C = nop

; Skip BigRedButton::subtitle_show
0x307C270 = blr

; Skip CBrbAICompanion::show_picon
0x31FED4C = blr

; Skip CbrbObjectiveMarker::Enable
0x331B924 = blr

[WiiULauncher0JP]
moduleMatches = 0x0D395735

; Skip flag override in BRB_HUDManager::HUD_Enable if second argument is not zero
0x306E82C = nop

; Skip BigRedButton::subtitle_show
0x307C1EC = blr

; Skip CBrbAICompanion::show_picon
0x31FEEF8 = blr

; Skip CbrbObjectiveMarker::Enable
0x331BC08 = blr

[WiiULauncher16]
moduleMatches = 0x113CC316

; Skip flag override in BRB_HUDManager::HUD_Enable if second argument is not zero
0x306EA78 = nop

; Skip BigRedButton::subtitle_show
0x307C4B0 = blr

; Skip CBrbAICompanion::show_picon
0x31FEF34 = blr

; Skip CbrbObjectiveMarker::Enable
0x331BCE4 = blr