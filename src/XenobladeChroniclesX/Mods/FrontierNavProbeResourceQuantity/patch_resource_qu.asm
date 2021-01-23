[XCX_FN_RES_QTY_ALL] ######################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

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

[XCX_FN_RES_QTY] ######################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x027D5428 = bla _multCount

[XCX_FN_RES_QTY_1U] ######################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x027D53C8 = bla _multCount
