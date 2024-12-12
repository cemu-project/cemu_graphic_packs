[XCX_level]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

; get lv 027e14f ; get exp 027e1504 ; set lv 027e1510 ; set exp 027e151c

_levelMemorJP100:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x489c (r3)
b _charLevelCheat

_levelMemorUS100:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x3e78 (r3)
b _charLevelCheat

_levelMemorJP102:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x42b0 (r3)
b _charLevelCheat

_levelMemorEU101US102:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x3d78 (r3)

_charLevelCheat:
; Character Level
li r4, $level
stb r4, $memoffset (r3)

;fixes the line we over wrote
addi r3,r1,0x8
blr

[XCX_Level_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; Our code applies when the reqMenuCreateParty function is used
0x023429F0 = bla _levelMemorEU101US102

[XCX_Level_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02342224 = bla _levelMemorJP102

[XCX_Level_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02342980 = bla _levelMemorUS100

[XCX_Level_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x023420B0 = bla _levelMemorJP100
