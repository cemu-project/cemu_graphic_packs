[XCX_MOONJUMP]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

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

[XCX_MOONJUMP_ALL]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x0264A700 = bla _setVelocity
0x0264AD40 = bla _setHorizVelocity

; chr::CIL_BaseJump::decideLandingType((void))
0x024714E0 = li r3, 5

[XCX_MOONJUMP_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x0264A690 = bla _setVelocity
0x0264ACD0 = bla _setHorizVelocity

0x02471470 = li r3, 5
