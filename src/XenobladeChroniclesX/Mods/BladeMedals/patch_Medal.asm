[XCX_BladeMedal_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; write bp - addWorldEnemyTicket__Q2_2fw12SocialSystemFi
0x0288AA80 = addi r8, r3, 0 ; medals dont decrease when doing world enemy

; read bp - getWorldEnemyTicket__Q2_2fw12SocialSystemCFv
0x02888DF8 = li r3, $medals ; makes the game read given value
0x02888DE8 = li r3, $medals ; makes the game read given value
0x02888E04 = nop ; removes 9999 blade medal cap, loops to negatives at 32767

[XCX_BladeMedal_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x028879E0 = addi r8, r3, 0
0x02885D58 = li r3, $medals
0x02885D48 = li r3, $medals
0x02885D64 = nop

[XCX_BladeMedal_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0288AA04 = addi r8, r3, 0
0x02888D7C = li r3, $medals
0x02888D6C = li r3, $medals
0x02888D88 = nop

[XCX_BladeMedal_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02886608 = addi r8, r3, 0
0x02884980 = li r3, $medals
0x02884970 = li r3, $medals
0x0288498C = nop
