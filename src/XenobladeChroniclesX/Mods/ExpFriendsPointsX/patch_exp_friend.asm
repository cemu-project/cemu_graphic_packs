[XCX_FRIENDPOINTSX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $mod

; ----------------------------------------------------------------------------
; WHO  : RegistDamage_SoulVoiceLink__Q2_12DamageSystem7FactorySFRCQ2_3cfs30CfHandleKey__tm__11_XCUiL_2_12T1Ui
; WHAT : Gives a lot of friend points when activating a Soul Voice Link during combat
;      : BEWARE as this can lead to freeze of the emulator when opening the Affinity Chart (not sure if this is related)

0x02179908 = li r31, $mod
