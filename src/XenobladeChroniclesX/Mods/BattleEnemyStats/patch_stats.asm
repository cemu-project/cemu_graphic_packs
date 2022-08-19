; DO NOT add 1.0.2J support untill official XCX game servers go offline
; DO NOT add 1.0.2U, 1.0.1E or 1.0.0E support untill official XCX game servers go offline
;to remove the update go to your mlc folder then /usr/title/0005000e/ then change '101c4d00' to '-101c4d00' for the US version or change '10116100' to '-10116100' for the JP version. to install the updates again simply change the name(s) back to how they originally where

[XCX_ENEMIESTATS]
moduleMatches = 0xAB97DE6B, 0x676EB33E

; ----------------------------------------------------------------------------
; WHO  : calcEnParam__3cfsFPQ2_3cfs7SChrPrmUiT2
; WHAT : Apply modificator on enemies stats (HP, Melee Attack, Melee Accuracy, Ranged Attack, Ranged Accuracy, Potential and Evasion)

; 100% = 0.001 - default value
;  70% = 0.0007
;  50% = 0.0005
;   1% = 0.00001 ; GAME CRASH (enemis are too weak)

0x1003206C = .float $mod



[XCX_ENEMIESTATS_V]
moduleMatches = 0x785CA8A9
0x10031FDC = .float $mod
