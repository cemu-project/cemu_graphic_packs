[XCX_FREECAM_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;this mod accesses the developer freecam used by the monolith soft devs
;we simply just prevent 2 functions from ever being called

0x025f4e00 = blr ;isFreeCamera__Q2_3cfs14CfSceneManagerCFv
0x0276A774 = nop ;MenuTask::openHudEventCamera

[XCX_FREECAM_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x025F43DC = blr
0x02768EEC = nop

[XCX_FREECAM_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x025f4d90 = blr
0x0276A714 = nop

[XCX_FREECAM_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x025f3900 = blr
0x02767F7C = nop
