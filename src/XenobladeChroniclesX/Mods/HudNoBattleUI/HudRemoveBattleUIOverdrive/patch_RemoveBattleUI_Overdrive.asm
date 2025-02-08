[XCX_RemoveBattleUI_Overdrive_v101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
;MISSING: overdrive start animation, overdrive aura activation animation
;debating whether to sperate these 3 UI elements into their own packs but keeping them in 1 for now
;no ui remove overdrive bonus
0x021bee34 = nop ;gearStart__8MenuTaskFUiUcT2
;no ui remove overdrive count
0x02c77fc4 = blr ;gearAddCount__8MenuTaskFUiUc
;no ui remove end of overdrive damage
0x02b461c0 = nop ;draw__Q2_4menu14MenuGearDamageFv

[XCX_RemoveBattleUI_Overdrive_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x021bee34 = nop ;gearStart__8MenuTaskFUiUcT2
0x02c77f64 = blr ;gearAddCount__8MenuTaskFUiUc
0x02b461b0 = nop ;draw__Q2_4menu14MenuGearDamageFv

[XCX_RemoveBattleUI_Overdrive_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021be900 = nop ;gearStart__8MenuTaskFUiUcT2
0x02c734b8 = blr ;gearAddCount__8MenuTaskFUiUc
0x02b42100 = nop ;draw__Q2_4menu14MenuGearDamageFv

[XCX_RemoveBattleUI_Overdrive_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x021bee34 = nop ;gearStart__8MenuTaskFUiUcT2
0x02c77dec = blr ;gearAddCount__8MenuTaskFUiUc
0x02b46134 = nop ;draw__Q2_4menu14MenuGearDamageFv

[XCX_RemoveBattleUI_Overdrive_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021be67c = nop ;gearStart__8MenuTaskFUiUcT2
0x02c6f9a4 = blr ;gearAddCount__8MenuTaskFUiUc
0x02b3fdb4 = nop ;draw__Q2_4menu14MenuGearDamageFv
