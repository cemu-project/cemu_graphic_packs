[XCX_RemoveBattleUI_NoPlayerHealth_v101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
;MISSING: battle menu
;No player health bar, must be applied on boot
0x02c6ab98 = nop ;init pc status
;removes player hp when the pause menu is open
0x02c773b0 = nop ;disp status all
;No player health bar, must be applied on boot
;0x02bbebe0 = blr ;init menu pc status

[XCX_RemoveBattleUI_NoPlayerHealth_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02c6ab38 = nop ;init pc status
0x02c77350 = nop ;disp status all
;0x02bbebd0 = blr ;init menu pc status

[XCX_RemoveBattleUI_NoPlayerHealth_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02c660ac = nop ;init pc status
0x02c728a4 = nop ;disp status all
;0x02bba6cc = blr ;init menu pc status

[XCX_RemoveBattleUI_NoPlayerHealth_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02c6a9c0 = nop ;init pc status
0x02c771d8 = nop ;disp status all
;0x02bbeae0 = blr ;init menu pc status

[XCX_RemoveBattleUI_NoPlayerHealth_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02c62598 = nop ;init pc status
0x02c6ed90 = nop ;disp status all
;0x02bb7b54 = blr ;init menu pc status
