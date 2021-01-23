[XCX_CAMERA_DIST]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

VarZoom:
	.float $mod

; CamData::CCamDataManager::getParamsZoomDefault((CamData::eTargetTypes, unsigned char))
0x0222A19C = lis       r12, VarZoom@ha
0x0222A1B0 = lfs       f1, VarZoom@l(r12)
0x0222A1CC = nop
