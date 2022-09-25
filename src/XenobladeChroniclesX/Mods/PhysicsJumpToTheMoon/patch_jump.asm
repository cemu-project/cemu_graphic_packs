[XCX_MOONJUMP]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $landtype

VarVelocityV:
	.float $vert
VarVelocityH:
	.float $horz

_setVelocity:
lis       r3, VarVelocityV@ha
lfs       f30, VarVelocityV@l(r3)
fdivs     f30, f1, f30
blr

_setHorizVelocity:
lis       r4, VarVelocityH@ha
lfs       f31, VarVelocityH@l(r4)
fmuls     f1, f1, f31
stfs	  f1, 0x18(r1)
blr


[XCX_MOONJUMP_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x0264A700 = bla _setVelocity
0x0264AD40 = bla _setHorizVelocity

; chr::CIL_BaseJump::decideLandingType((void))
0x024714E0 = li r3, $landtype

[XCX_MOONJUMP_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02649CDC = bla _setVelocity
0x0264A31C = bla _setHorizVelocity

0x02470B20 = li r3, $landtype

[XCX_MOONJUMP_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0264A690 = bla _setVelocity
0x0264ACD0 = bla _setHorizVelocity

0x02471470 = li r3, $landtype

[XCX_MOONJUMP_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02649200 = bla _setVelocity
0x02649840 = bla _setHorizVelocity

0x02470044 = li r3, $landtype
