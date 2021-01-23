[XCX_MOONJUMP]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

VarVelocityV:
	.float $vert ; vertical velocity (default is 1.00, speedrun is 1.05)
VarVelocityH:
	.float $horz ; horizontal velocity (default is 1.00, speedrun is 2.0)


_setVelocity:
lis       r3, VarVelocityV@ha
lfs       f30, VarVelocityV@l(r3)
fdivs     f30, f1, f30
blr

_setHorizVelocity:
lis       r12, VarVelocityH@ha
lfs       f31, VarVelocityH@l(r12)
fdivs     f31, f1, f31
blr

[XCX_MOONJUMP_ALL]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x0264A700 = bla _setVelocity
0x0264C0EC = bla _setHorizVelocity

; chr::CIL_BaseJump::decideLandingType((void))
0x024714E0 = li r3, 5

[XCX_MOONJUMP_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x0264A690 = bla _setVelocity
0x0264C07C = bla _setHorizVelocity

0x02471470 = li r3, 5
