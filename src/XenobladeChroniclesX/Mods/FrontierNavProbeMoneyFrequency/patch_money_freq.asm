[XCX_FN_MNY_FREQ]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mod
; ----------------------------------------------------------------------------
; WHAT : changeTime__Q2_4fnet9CFnetTaskFUiT1
; WHY  : Affect the frequency of the NavFrontier income for the money
;        Frequency unit is 1 minute (so by default income is every 15 minutes)

[XCX_FN_MNY_FREQ_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x027D554C = li r12, $mod

[XCX_FN_MNY_FREQ_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027D3184 = li r12, $mod

[XCX_FN_MNY_FREQ_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027D54EC = li r12, $mod

[XCX_FN_MNY_FREQ_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027D2180 = li r12, $mod
