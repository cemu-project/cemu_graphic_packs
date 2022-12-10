[XCX_BGMNOFLIGHT_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; ----------------------------------------------------------------------------
; WHO  : cfs::CfSoundManager::fbgmUpdate((void))
; WHAT : Never call function cfs::CfSoundManager::fbgmChangeNameDoll((bool)) so that Skell Flight music is never played
0x022A4DD4 = _skip:
0x022A4DC0 = b _skip

[XCX_BGMNOFLIGHT_V102J]
moduleMatches = 0x7672271D ; 1.0.2
0x022A47EC = _skip:
0x022A47D8 = b _skip

[XCX_BGMNOFLIGHT_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x022A4D64 = _skip:
0x022A4D50 = b _skip

[XCX_BGMNOFLIGHT_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x022A4540 = _skip:
0x022A452C = b _skip
