[XCX_FixCameraBug_v101E_v102U_v100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
;Prevents checkRoom__Q2_3Cam8CRootCamFPQ2_3cfs5CfObj from ever being called
0x0222EE70 = blr

[XCX_FixCameraBug_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x0222E93C = blr

[XCX_FixCameraBug_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x0222E6B8 = blr
