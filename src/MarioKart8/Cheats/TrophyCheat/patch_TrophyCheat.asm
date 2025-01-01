[MarioKart8_GoldTrophy]
moduleMatches = 0x9F0A90B7, 0xD09700CE ; v4.2(EU/NA/JP), v4.1(EU/NA/JP)
.origin = codecave

WriteTrophies:
addi r11, r11, -1
mtctr r12
_forloopWriteTrophies:
 stbu r8, 1(r11)
 bdnz _forloopWriteTrophies
blr

CheckandChangeTrophies:
mflr r0
;check cheat
li r8, $cheattype
cmpwi r8, 3
beq Cheat3StarEVERYTHING
cmpwi r8, 2
beq CheatEntireEngineClass
cmpwi r8, 1
beq CheatSpecificCup
b CheckandChangeTrophies_Exit

CheatSpecificCup:
li r8, $trophy
addi r11, r7, 0x5c4+$addroffset
stb r8, $cup(r11)
li r8, $stars
addi r11, r7, 0x5c4+$addroffset-0x100
stb r8, $cup(r11)
b CheckandChangeTrophies_Exit

CheatEntireEngineClass:
li r12, 12
li r8, $trophy
addi r11, r7, 0x5c4+$addroffset
bl WriteTrophies
li r8, $stars
addi r11, r7, 0x5c4+$addroffset-0x100
bl WriteTrophies
b CheckandChangeTrophies_Exit

Cheat3StarEVERYTHING:
li r12, 12
;50cc
li r8, $trophy
addi r11, r7, 0x5c4
bl WriteTrophies
li r8, $stars
addi r11, r7, 0x5c4-0x100
bl WriteTrophies
;100cc
li r8, $trophy
addi r11, r7, 0x5c4+0x20
bl WriteTrophies
li r8, $stars
addi r11, r7, 0x5c4+0x20-0x100
bl WriteTrophies
;150cc
li r8, $trophy
addi r11, r7, 0x5c4+0x40
bl WriteTrophies
li r8, $stars
addi r11, r7, 0x5c4+0x40-0x100
bl WriteTrophies
;Mirror
li r8, $trophy
addi r11, r7, 0x5c4+0x80
bl WriteTrophies
li r8, $stars
addi r11, r7, 0x5c4+0x80-0x100
bl WriteTrophies
;200cc
li r8, $trophy
addi r11, r7, 0x5c4+0x60
bl WriteTrophies
li r8, $stars
addi r11, r7, 0x5c4+0x60-0x100
bl WriteTrophies

CheckandChangeTrophies_Exit:
mtlr r0
lwz r8, 0(r29)
blr

[MarioKart8_GoldTrophy_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
;modifies near 0x2E6B520C
0x024D97F8 = bla CheckandChangeTrophies

[MarioKart8_GoldTrophy_v41]
moduleMatches = 0xD09700CE ; v4.1(EU/NA/JP)
0x024d9474 = bla CheckandChangeTrophies
