[XCX_NoBGM_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; WHO  : cfs::CfSoundManagerBGM::bgmPlay
; WHAT : Never process this function so that music is never played
0x022A2440 = blr

[XCX_NoBGM_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x022A1E58 = blr

[XCX_NoBGM_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x022A23D0 = blr

[XCX_NoBGM_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x022A1BAC = blr
