[XCX_NoOffline_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
; WHO  : s_offline_frameIn
; WHAT : Never process this function so that the online label is never shown
0x100B0B50 = nop ; frameIn

[XCX_NoOffline_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x100B0B38 = nop ; frameIn

[XCX_NoOffline_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x100B099C = nop ; frameIn

[XCX_NoOffline_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x100B0AA0 = nop ; frameIn

[XCX_NoOffline_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x100B06DB = nop ; frameIn ;
