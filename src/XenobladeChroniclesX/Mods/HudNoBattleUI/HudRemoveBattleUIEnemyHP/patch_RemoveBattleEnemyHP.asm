[XCX_RemoveBattleUI_EnemyHealth_v101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
;MISSING: enemy health bar animation
;removes enemy hp
0x02c136bc = nop ;init enemy menu target status
;also remove enemy hp and cause the enemy hp bar animation to appear where its not supposed to
;0x02c1484c = nop ;init target menu target status
;removes info above a playaber characters head when recruiting them
;0x02c136e4 = nop ;init npc menu target status
;???, must be applied on boot
;0x02c6aba8 = nop ;init target status menu task

[XCX_RemoveBattleUI_EnemyHealth_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02c136ac = nop ;init enemy menu target status
;0x02c1483c = nop ;init target menu target status
;0x02c136d4 = nop ;init npc menu target status
;0x02c6ab48 = nop ;init target status menu task

[XCX_RemoveBattleUI_EnemyHealth_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02c0f0cc = nop ;init enemy menu target status
;0x02c1025c = nop ;init target menu target status
;0x02c0f0f4 = nop ;init npc menu target status
;0x02c660bc = nop ;init target status menu task

[XCX_RemoveBattleUI_EnemyHealth_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02c135bc = nop ;init enemy menu target status
;0x02c1474c = nop ;init target menu target status
;0x02c135e4 = nop ;init npc menu target status
;0x02c6a9d0 = nop ;init target status menu task

[XCX_RemoveBattleUI_EnemyHealth_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02c0c1d4 = nop ;init enemy menu target status
;0x02c0d364 = nop ;init target menu target status
;0x02c0c1fc = nop ;init npc menu target status
;0x02c625a8 = nop ;init target status menu task
