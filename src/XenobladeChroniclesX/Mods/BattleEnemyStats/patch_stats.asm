[XCX_ENEMIESTATS_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
; ------------------------------------------------------------------------
; WHO  : calcEnParam__3cfsFPQ2_3cfs7SChrPrmUiT2
; WHAT : Apply modificator on enemies stats (HP, Melee Attack, Melee Accuracy, Ranged Attack, Ranged Accuracy, Potential and Evasion)

; 100% = 0.001 - default value ;;
;  70% = 0.0007
;  50% = 0.0005
;   1% = 0.00001 ; GAME CRASH (enemis are too weak)
0x0295B678 = li r3, -3
0x1003206C = .float $mod

[XCX_ENEMIESTATS_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x0295B668 = li r3, -3
0x1003206C = .float $mod

;[XCX_ENEMIESTATS_V102J]
;DO NOT port to JP 1.0.2 untill official game servers go offline

[XCX_ENEMIESTATS_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0295B5EC = li r3, -3
0x1003206C = .float $mod

[XCX_ENEMIESTATS_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02956D10 = li r3, -3
0x10031FDC = .float $mod
