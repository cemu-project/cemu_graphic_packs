[XCX_BGMNOOVER_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; ----------------------------------------------------------------------------
; WHO  : cfs::CfSoundManagerBGM::playgear((unsigned int))
; WHAT : Never process this function so that Overdrive music is never played
0x022AB1F4 = blr

[XCX_BGMNOOVER_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x022AAC0C = blr

[XCX_BGMNOOVER_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x022AB184 = blr

[XCX_BGMNOOVER_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x022AA960 = blr
