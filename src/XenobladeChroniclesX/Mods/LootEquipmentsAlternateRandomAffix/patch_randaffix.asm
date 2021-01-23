[XCX_LOOT_RANDOM_AFFIX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

; ----------------------------------------------------------------------------
; WHO  : calcAffix__Q2_8ItemDrop16CItemDropManagerFUsRQ2_3mtl32fixed_vector__tm__12_UsXCUiL_1_3
; WHAT : Affix random truly
;		 Everything above 80% is capped at 80%, and everything else is set to 20%

_minDropRate:
lbz r27, 0x0C(r1)
cmpwi r27, 80
blt percent20
li r27, 80
blr
percent20:
li r27, 20
blr

0x021AB778 = bla _minDropRate
