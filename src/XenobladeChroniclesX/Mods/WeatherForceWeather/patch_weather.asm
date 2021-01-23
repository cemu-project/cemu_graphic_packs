[XCX_CHANGEWEATHER]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

.int $wtr

; cfs::CfWtrManager::setWeatherID((unsigned int, int))
0x0229F0FC = li r28, $wtr

; cfs::CfWtrManager::update((float))
0x022B587C = nop

[XCX_CHANGEWEATHER_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

.origin = codecave

.int $wtr

0x0229F08C = li r28, $wtr
0x022B580C = nop
