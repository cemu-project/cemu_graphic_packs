[XCX_LOOT_EQUIPMENT_TYPE]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $type
.int $sub
; ----------------------------------------------------------------------------
; WHO  : __CPR98__calcItemTableID__Q2_8ItemDrop16CItemDropManagerFUcRCQ3_J20JJ29J11SCreateInfoRUs
; WHAT : Force some kind of equipment to be looted in Gold chests
;		 2 = Ground weapons
;		 4 = Ground armors
;		 6 = Skell weapons
;		 8 = Skell armors

; Ground Weapons
_notRand:
li r4, $sub
cmpwi r4, 0
beq exit_notRand
li r3, 0x64
exit_notRand:
cmplw r3, r12
blr

_setSubGW:
li r3, $sub
cmpwi r3, 0
beq exit_setSubGW
subi r30, r3, 1
exit_setSubGW:
addi      r3, r1, 0x54
blr

_setSubGA:
li r3, $sub
cmpwi r3, 0
beq exit_setSubGA
subi r4, r3, 1
exit_setSubGA:
addi      r3, r1, 0x6C
blr

_setSubSA:
li r3, $sub
cmpwi r3, 0
beq exit_setSubSA
subi r4, r3, 1
exit_setSubSA:
addi      r3, r1, 0x9C
blr


[XCX_LOOT_EQUIPMENT_TYPE_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
0x021AEB88 = li r4, $type
0x021AEB5C = li r27, $type
0x021AC280 = bla _notRand
0x021AD6DC = bla _setSubGW
0x021ADD28 = bla _setSubGA
0x021AE420 = bla _setSubSA
;0x021AD9A4 = li r3, 4 ; force index

[XCX_LOOT_EQUIPMENT_TYPE_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021AE654 = li r4, $type
0x021AE628 = li r27, $type
0x021ABD4C = bla _notRand
0x021AD1A8 = bla _setSubGW
0x021AD7F4 = bla _setSubGA
0x021ADEEC = bla _setSubSA
;0x021AD470 = li r3, 4 ; force index

[XCX_LOOT_EQUIPMENT_TYPE_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021AE3D0 = li r4, $type
0x021AE3A4 = li r27, $type
0x021ABAC8 = bla _notRand
0x021ACF24 = bla _setSubGW
0x021AD570 = bla _setSubGA
0x021ADC68 = bla _setSubSA
;0x021AD1EC = li r3, 4 ; force index
