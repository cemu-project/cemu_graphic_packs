[XCX_FN_RES_FREQ_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; ----------------------------------------------------------------------------
; WHAT : changeTime__Q2_4fnet9CFnetTaskFUiT1
; WHY  : Affect the frequency of the NavFrontier income for the resources
;        Frequency unit is 1 minute (so by default income is every 5 minutes)
0x027D534C = li r12, $mod

[XCX_FN_RES_FREQ_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027D2F84 = li r12, $mod

[XCX_FN_RES_FREQ_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027D52EC = li r12, $mod

[XCX_FN_RES_FREQ_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027D1F80 = li r12, $mod
