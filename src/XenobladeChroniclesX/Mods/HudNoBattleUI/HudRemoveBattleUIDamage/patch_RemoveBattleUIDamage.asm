;[XCX_RemoveBattleUI_TESTING_v101E]
;moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E

[XCX_RemoveBattleUI_TESTING_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
;testing:
;0x02c6ab20 = blr ; initUI__8MenuTaskFv
;0x02c6ab48 = nop ;init target status menu task
;0x02c6ab54 = nop ; initDamageValue
;0x02c6ab6c = nop ; initSubTarget
;0x02c6ab78 = nop ; initArtspalette
0x02c6a2b0 = blr ; initDamageValue
0x02ae0580 = nop ; draw__Q2_4menu22MenuDamageValueManagerFv

;[XCX_RemoveBattleUI_TESTING_v102J]
;moduleMatches = 0x7672271D ; 1.0.2J

;[XCX_RemoveBattleUI_TESTING_v100U]
;moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U

;[XCX_RemoveBattleUI_TESTING_v100J]
;moduleMatches = 0x785CA8A9 ; 1.0.0J
