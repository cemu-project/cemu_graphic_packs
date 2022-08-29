[XCX_FPS++_Overdrive_General]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

_over:
	fmr f31, f1
	lis r31, averageFPS1Inv@ha
	lfs f1, averageFPS1Inv@l(r31)
	fmuls f1, f31, f1
	blr


[XCX_FPS++_Overdrive_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
0x021BC904 = bla _over ; Gear::CGear::update((float))
0x021E2020 = bla _over ; Gear::CMode::Update((float))

[XCX_FPS++_Overdrive_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021BC3D0 = bla _over ; Gear::CGear::update((float))
0x021E1AEC = bla _over ; Gear::CMode::Update((float))

[XCX_FPS++_Overdrive_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021BC14C = bla _over ; Gear::CGear::update((float))
0x021E1868 = bla _over ; Gear::CMode::Update((float))
