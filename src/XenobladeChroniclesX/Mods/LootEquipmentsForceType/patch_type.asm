[XCX_LOOT_EQUIPMENT_TYPE]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

; ----------------------------------------------------------------------------
; WHO  : __CPR98__calcItemTableID__Q2_8ItemDrop16CItemDropManagerFUcRCQ3_J20JJ29J11SCreateInfoRUs
; WHAT : Force some kind of equipment to be looted in Gold chests
;		 2 = Ground weapons
;		 4 = Ground armors
;		 6 = Skell weapons
;		 8 = Skell armors

.int $type

0x021AEB88 = li r4, $type
0x021AEB5C = li r27, $type

.int $sub

; Ground Weapons
_notRand:
li r4, $sub
cmpwi r4, 0
beq exit_notRand
li r3, 0x64
exit_notRand:
cmplw r3, r12
blr

0x021AC280 = bla _notRand

_setSubGW:
li r3, $sub
cmpwi r3, 0
beq exit_setSubGW
subi r30, r3, 1
exit_setSubGW:
addi      r3, r1, 0x54
blr

0x021AD6DC = bla _setSubGW

_setSubGA:
li r3, $sub
cmpwi r3, 0
beq exit_setSubGA
subi r4, r3, 1
exit_setSubGA:
addi      r3, r1, 0x6C
blr

0x021ADD28 = bla _setSubGA

_setSubSA:
li r3, $sub
cmpwi r3, 0
beq exit_setSubSA
subi r4, r3, 1
exit_setSubSA:
addi      r3, r1, 0x9C
blr

0x021AE420 = bla _setSubSA

;0x021AD9A4 = li r3, 4 ; force index
