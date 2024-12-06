[XCX_CharacterSize]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

charHeight:
.float $height ;(Character Depth, Height, and Width)
bustX:
.float $bustX ;(Chest Depth)
bustY:
.float $bustY ;(Chest Height)
bustZ:
.float $bustZ ;(Chest Width)

_sizeMemorJP100:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x489c (r3)
b _charSize

_sizeMemorUS100:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x3e78 (r3)
b _charSize

_sizeMemorJP102:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x42b0 (r3)
b _charSize

_sizeMemorEU101US102:
;reads from the static address that stores the address for the start of character info memory section
lis r3, 0x103a
lwz r3, -0x3d78 (r3)

_charSize:
; Character Height (total character size)
lis r25, charHeight@ha
lfs f31, charHeight@l(r25)
stfs f31, $memoffset (r3)

li r25, 0xFFFF
cmpwi r25, $notexist
bne _charBustNormal
stw r25, $memoffset (r3)

_charBustNormal:
cmpwi r25, $invis
beq _invisBust
li r25, 0xD
cmpwi r25, $characterID
beq _resetMaleChar

lis r25, bustX@ha
lfs f31, bustX@l(r25)
stfs f31, $memoffset+0x4 (r3)
lis r25, bustY@ha
lfs f31, bustY@l(r25)
stfs f31, $memoffset+0x8 (r3)
lis r25, bustZ@ha
lfs f31, bustZ@l(r25)
stfs f31, $memoffset+0xC (r3)
b _leaveCharSize

_resetMaleChar:
lis r25, 0x3F42
ori r25, r25, 0x8F5C
stw r25, $memoffset+0x4 (r3)
lis r25, 0x3F47
ori r25, r25, 0xAE14
stw r25, $memoffset+0x8 (r3)
lis r25, 0x3F33
ori r25, r25, 0x3333
stw r25, $memoffset+0xC (r3)
b _leaveCharSize

_invisBust:
;bustXYZ = 0xFFFFFFFF
stw r25, $memoffset+0x4 (r3)
stw r25, $memoffset+0x8 (r3)
stw r25, $memoffset+0xC (r3)

_leaveCharSize:
;Restores the line we overwrote
lis r25, 0x103a
blr

[XCX_ChararacterSize_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; Our code applies when the reqMenuCreateParty function is used
0x023428CC = bla _sizeMemorEU101US102

[XCX_ChararacterSize_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02342100 = bla _sizeMemorJP102

[XCX_ChararacterSize_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0234285C = bla _sizeMemorUS100

[XCX_ChararacterSize_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02341F8C = bla _sizeMemorJP100
