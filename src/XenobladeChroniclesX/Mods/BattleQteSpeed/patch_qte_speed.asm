[XCX_QTE_SPEED_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
; ----------------------------------------------------------------------------
; WHO   : SoulVoice::CSoulVoice::getDifficulty((void))
; WHAT  : QTE speed does not increase
0x022078D4 = li r3, $mod

[XCX_QTE_SPEED_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x022073A0 = li r3, $mod

[XCX_QTE_SPEED_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x0220711C = li r3, $mod
