[XCX_LOOT_RANDOM_AFFIX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $var1 ; 80
.int $var2 ; 80
.int $var3 ; 20
; ----------------------------------------------------------------------------
; WHO  : calcAffix__Q2_8ItemDrop16CItemDropManagerFUsRQ2_3mtl32fixed_vector__tm__12_UsXCUiL_1_3
; WHAT : Affix random truly
;		 Everything above 80% is capped at 80%, and everything else is set to 20%
_minDropRate:
lbz r27, 0x0C(r1)
cmpwi r27, $var1 ; 80
blt percent20
li r27, $var2 ; 80
blr
percent20:
li r27, $var3 ; 20
blr


[XCX_LOOT_RANDOM_AFFIX_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
0x021AB778 = bla _minDropRate

[XCX_LOOT_RANDOM_AFFIX_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021AB244 = bla _minDropRate

[XCX_LOOT_RANDOM_AFFIX_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021AAFC0 = bla _minDropRate
