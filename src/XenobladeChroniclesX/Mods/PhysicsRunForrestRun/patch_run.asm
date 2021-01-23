[XCX_MOVESPEED]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

VarSpeed:
	.float $mod ; dash speed (smallest means fastest, default is 1.0)

_setSpeed:
lis       r3, VarSpeed@ha
lfs       f13, VarSpeed@l(r3)
fdivs     f1, f1, f13
lwz       r3, 0(r31)
blr

[XCX_MOVESPEED_ALL]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

; chr::CInnerLabelState::applyFieldMoveWeight((float))
0x02643330 = bla _setSpeed ; SetVariableFloat(0xBD,float)

[XCX_MOVESPEED_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x026432C0 = bla _setSpeed
