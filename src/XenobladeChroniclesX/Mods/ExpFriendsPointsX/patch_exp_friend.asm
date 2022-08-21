[XCX_FRIENDPOINTSX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mod
; ----------------------------------------------------------------------------
; WHO  : RegistDamage_SoulVoiceLink__Q2_12DamageSystem7FactorySFRCQ2_3cfs30CfHandleKey__tm__11_XCUiL_2_12T1Ui
; WHAT : Gives a lot of friend points when activating a Soul Voice Link during combat
;      : BEWARE as this can lead to freeze of the emulator when opening the Affinity Chart (not sure if this is related)

[XCX_FRIENDPOINTSX_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
0x02179908 = li r31, $mod

[XCX_FRIENDPOINTSX_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021793D4 = li r31, $mod

[XCX_FRIENDPOINTSX_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02179150 = li r31, $mod
