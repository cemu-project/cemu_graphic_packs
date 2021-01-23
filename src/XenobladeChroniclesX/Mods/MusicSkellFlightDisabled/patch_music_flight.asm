[XCX_BGMNOFLIGHT]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

; ----------------------------------------------------------------------------
; WHO  : cfs::CfSoundManager::fbgmUpdate((void))
; WHAT : Never call function cfs::CfSoundManager::fbgmChangeNameDoll((bool)) so that Skell Flight music is never played

0x022A4DD4 = _skip:
0x022A4DC0 = b _skip

[XCX_BGMNOFLIGHT_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x022A4D64 = _skip:
0x022A4D50 = b _skip
