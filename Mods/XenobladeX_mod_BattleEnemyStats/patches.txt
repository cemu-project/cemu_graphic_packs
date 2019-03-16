[XCX_ENEMIESTATS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

; ----------------------------------------------------------------------------
; WHO  : calcEnParam__3cfsFPQ2_3cfs7SChrPrmUiT2
; WHAT : Apply modificator on enemies stats (HP, Melee Attack, Melee Accuracy, Ranged Attack, Ranged Accuracy, Potential and Evasion)

; 100% = 0.001 - default value
;  70% = 0.0007
;  50% = 0.0005
;   1% = 0.00001 ; GAME CRASH (enemis are too weak)

0x1003206C = .float $mod
