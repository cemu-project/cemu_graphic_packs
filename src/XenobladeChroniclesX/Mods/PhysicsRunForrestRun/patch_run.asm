[XCX_MOVESPEED]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

VarSpeed:
	.float $mod ; dash speed (smallest means fastest, default is 1.0)

_setSpeed:
lis       r3, VarSpeed@ha
lfs       f13, VarSpeed@l(r3)
fdivs     f1, f1, f13
lwz       r3, 0(r31)
blr

[XCX_MOVESPEED_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; chr::CInnerLabelState::applyFieldMoveWeight((float))
0x02643330 = bla _setSpeed ; SetVariableFloat(0xBD,float)

[XCX_MOVESPEED_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x0264290C = bla _setSpeed

[XCX_MOVESPEED_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x026432C0 = bla _setSpeed

[XCX_MOVESPEED_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02641E30 = bla _setSpeed
