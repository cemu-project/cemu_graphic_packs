[XCX_FN_RES_QTY]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mod

; ----------------------------------------------------------------------------
; WHAT : changeTime__Q2_4fnet9CFnetTaskFUiT1
; WHY  : 
_multCount:
lbz       r0, 6(r31)
li 	   r3, $mod
mullw     r0, r0, r3
stb       r0, 6(r31)
blr

[XCX_FN_RES_QTY_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x027D5428 = bla _multCount

[XCX_FN_RES_QTY_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027D3060 = bla _multCount

[XCX_FN_RES_QTY_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027D53C8 = bla _multCount

[XCX_FN_RES_QTY_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027D205C = bla _multCount
