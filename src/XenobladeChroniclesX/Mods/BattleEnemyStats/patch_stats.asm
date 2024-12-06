; ------------------------------------------------------------------------
; WHO  : calcEnParam__3cfsFPQ2_3cfs7SChrPrmUiT2
; WHAT : Apply modificator on enemies stats (HP, Melee Attack, Melee Accuracy, Ranged Attack, Ranged Accuracy, Potential and Evasion)

; 100% = 0.001 - default value
;  70% = 0.0007
;  50% = 0.0005
;   1% = 0.00001 ; GAME CRASH (enemis are too weak)

[XCX_ENEMIESTATS_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
0x1003206C = .float $mod

[XCX_ENEMIESTATS_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x1003202C = .float $mod

[XCX_ENEMIESTATS_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x10031FDC = .float $mod
