[XCX_CameraDist]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
VarZoom:
	.float $mod

[XCX_CameraDist_v101E_v102U_v100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
; CamData::CCamDataManager::getParamsZoomDefault((CamData::eTargetTypes, unsigned char))
0x0222A19C = lis r12, VarZoom@ha
0x0222A1B0 = lfs f1, VarZoom@l(r12)
0x0222A1CC = nop

[XCX_CameraDist_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02229C68 = lis r12, VarZoom@ha
0x02229C7C = lfs f1, VarZoom@l(r12)
0x02229C98 = nop

[XCX_CameraDist_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x022299E4 = lis r12, VarZoom@ha
0x022299F8 = lfs f1, VarZoom@l(r12)
0x02229A14 = nop
