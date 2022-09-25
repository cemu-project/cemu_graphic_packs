[XCX_OVERDRIVE_V101E_102U_100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
; ----------------------------------------------------------------------------
; WHO  : Gear::CGear::IsPermit((void))
; WHAT : Always returns true to unlock Overdrive even before chapter 5
0x021B70AC = li r3, $mod
0x021B70C4 = li r3, $mod

[XCX_OVERDRIVE_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021B6B78 = li r3, $mod
0x021B6B90 = li r3, $mod

[XCX_OVERDRIVE_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021B68F4 = li r3, $mod
0x021B690C = li r3, $mod
