[XCX_BGMNOOVER]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

; ----------------------------------------------------------------------------
; WHO  : cfs::CfSoundManagerBGM::playgear((unsigned int))
; WHAT : Never process this function so that Overdrive music is never played

0x022AB1F4 = blr

[XCX_BGMNOOVER_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x022AB184 = blr