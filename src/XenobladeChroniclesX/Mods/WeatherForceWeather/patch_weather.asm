[XCX_CHANGEWEATHER]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $wtr

[XCX_CHANGEWEATHER_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; cfs::CfWtrManager::setWeatherID((unsigned int, int))
0x0229F0FC = li r28, $wtr
; cfs::CfWtrManager::update((float))
0x022B587C = nop

[XCX_CHANGEWEATHER_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x0229EB14 = li r28, $wtr
0x022B528C = nop

[XCX_CHANGEWEATHER_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0229F08C = li r28, $wtr
0x022B580C = nop

[XCX_CHANGEWEATHER_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x0229E868 = li r28, $wtr
0x022B5118 = nop
