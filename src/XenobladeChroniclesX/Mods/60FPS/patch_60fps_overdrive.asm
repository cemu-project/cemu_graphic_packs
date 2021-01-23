[XCX_60FPS_OVERDRIVE] ; ########################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

_timePassed:
	.float 0.5

_over:
	fmr f31, f1
	lis r31, _timePassed@ha
	lfs f1, _timePassed@l(r31)
	fmuls f1, f31, f1
	blr

0x021BC904 = bla _over