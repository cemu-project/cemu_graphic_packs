[XCX_ArtsUnlock]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

_ArtsMemorJP100:
;reads from the static address that stores the address for the start of character info memory section
lis r31, 0x103a
lwz r31, -0x489c (r31)
b _ArtsUnlockMod

_ArtsMemorUS100:
;reads from the static address that stores the address for the start of character info memory section
lis r31, 0x103a
lwz r31, -0x3e78 (r31)
b _ArtsUnlockMod

_ArtsMemorJP102:
;reads from the static address that stores the address for the start of character info memory section
lis r31, 0x103a
lwz r31, -0x42b0 (r31)
b _ArtsUnlockMod

_ArtsMemorEU101US102:
;reads from the static address that stores the address for the start of character info memory section
lis r31, 0x103a
lwz r31, -0x3d78 (r31)

_ArtsUnlockMod: ;r30 r16 r17 r31 r0 r12
cmpw r4, r29
beq _forceArtsinCreateParty

addi r17, r31, $memoffset-1
li r16, $arts
li r0, $check
cmpwi r0, 1        ; <- conditional for what cheat to do
beq _ArtsUnlockALL
cmpwi r0, 5
beq _forceArtsEquiped123
li r12, 0
cmpwi r0, 2
beq _unlockunusedarts
cmpwi r0, 3
beq UseSpecificCharactersArts
cmpwi r0, 4
beq _unlockIndividualArts



_forceArtsEquiped123:
subi r17, r17, 0x24C
li r16, $artadr4+2
stbu r16, 1(r17)
li r16, $art4
stbu r16, 1(r17)
li r16, $artadr3+2
stbu r16, 1(r17)
li r16, $art3
stbu r16, 1(r17)
li r16, $artadr2+2
stbu r16, 1(r17)
li r16, $art2
stbu r16, 1(r17)
li r16, $artadr1+2
stbu r16, 1(r17)
li r16, $arts
stbu r16, 1(r17)
li r16, $artadr8+2
stbu r16, 1(r17)
li r16, $art8
stbu r16, 1(r17)
li r16, $artadr7+2
stbu r16, 1(r17)
li r16, $art7
stbu r16, 1(r17)
li r16, $artadr6+2
stbu r16, 1(r17)
li r16, $art6
stbu r16, 1(r17)
li r16, $artadr5+2
stbu r16, 1(r17)
li r16, $art5
stbu r16, 1(r17)
li r16, $arts
addi r17, r31, $memoffset-1
b _unlockIndividualArts

UseSpecificCharactersArts:
addi r31, r31, $memoffset+0x9B
li r12, 0
_whileLoopUseSpecificCharactersArts:
stbu r12, 1(r17)
cmpw r17, r31
blt+ _whileLoopUseSpecificCharactersArts
subi r17, r31, 0x9B+1
li r16, $art9
stb r16, $art2adr1+1(r17)
stb r16, $art2adr2+1(r17)
stb r16, $art2adr3+1(r17)
stb r16, $art2adr4+1(r17)
stb r16, $art2adr5+1(r17)
stb r16, $art2adr6+1(r17)
stb r16, $art2adr7+1(r17)
stb r16, $art2adr8+1(r17)
stb r16, $art2adr9+1(r17)
stb r16, $art2adr10+1(r17)
stb r16, $art2adr11+1(r17)
stb r16, $art2adr12+1(r17)
stb r16, $art2adr13+1(r17)
stb r16, $art2adr14+1(r17)
stb r16, $art2adr15+1(r17)
stb r16, $art2adr16+1(r17)
li r16, $arts

_unlockIndividualArts:
;li r16, $arts
stb r16, $artadr1+1(r17)
li r16, $art2
stb r16, $artadr2+1(r17)
li r16, $art3
stb r16, $artadr3+1(r17)
li r16, $art4
stb r16, $artadr4+1(r17)
li r16, $art5
stb r16, $artadr5+1(r17)
li r16, $art6
stb r16, $artadr6+1(r17)
li r16, $art7
stb r16, $artadr7+1(r17)
li r16, $art8
stb r16, $artadr8+1(r17)
li r16, $arts
stb r16, $artadr9+1(r17)
stb r16, $artadr10+1(r17)
stb r16, $artadr11+1(r17)
stb r16, $artadr12+1(r17)
stb r16, $artadr13+1(r17)
stb r16, $artadr14+1(r17)
stb r16, $artadr15+1(r17)
stb r16, $artadr16+1(r17)
b _exitArtsUnlockedMod



_unlockunusedarts:
;li r16, $arts
stb r16, 0xD+1(r17) ;Full Burst
li r16, $art2
stb r16, 0x67+1(r17) ;Air Slash
b _exitArtsUnlockedMod


_ArtsUnlockALL:
;Unlocks ALL possible arts
lbz r12, 0x67+1(r17) ;saves the level of air slash
stb r12, $memoffset-0x337(r31) ;stores the level of air slash in memory
;airslash is stored where character name length is, the game auto fixes this value if its wrong
lbz r12, 0x0D+1(r17)

_RangedArtsClass123:
;li r16, $arts
li r0, $rclass
cmpwi r0, 1
bne _RangedArtsMission123
addi r30, r31, $memoffset+0x33
_whileLoopRangedArtsClass:
stbu r16, 1(r17)
cmpw r17, r30
blt+ _whileLoopRangedArtsClass
stb r16, $memoffset+0x74(r31) ;Boost Barrel
stb r16, $memoffset+0x75(r31) ;Sniper Barrel
stb r16, $memoffset+0x76(r31) ;Missile Barrel
stb r16, $memoffset+0x77(r31) ;Cannon Barrel

_RangedArtsMission123:
;li r16, $arts
li r0, $rmission
cmpwi r0, 1
bne _MeleeArtsClass123
addi r17, r31, $memoffset+0x78-1
addi r30, r31, $memoffset+0x88
_whileLoopRangedArtsMission:
stbu r16, 1(r17)
cmpw r17, r30
blt+ _whileLoopRangedArtsMission

_MeleeArtsClass123:
;li r16, $arts
li r0, $mclass
cmpwi r0, 1
bne _MeleeArtsMission123
addi r17, r31, $memoffset+0x35-1
addi r30, r31, $memoffset+0x72
_whileLoopMeleeArtsClass:
stbu r16, 1(r17)
cmpw r17, r30
blt+ _whileLoopMeleeArtsClass

_MeleeArtsMission123:
;li r16, $arts
li r0, $mmission
cmpwi r0, 1
bne _ExitArtsUnlockALL
addi r17, r31, $memoffset+0x89-1
addi r30, r31, $memoffset+0x9B
_whileLoopMeleeArtsMission:
stbu r16, 1(r17)
cmpw r17, r30
blt+ _whileLoopMeleeArtsMission

_ExitArtsUnlockALL:
addi r31, r31, $memoffset
stb r12, 0x0D(r31) ; restores the level of full burst
lbz r12, -0x337(r31) ; grabs air slash's level
stb r12, 0x67(r31) ; restores the level of air slash
;fixes bytes that are supposed to be 00
li r16, 0x00
stb r16, -1(r31)
stb r16, 0x0E(r31)
stb r16, 0x16(r31)
stb r16, 0x1E(r31)
stb r16, 0x25(r31)
stb r16, 0x2D(r31)
stb r16, 0x34(r31)
stb r16, 0x3D(r31)
stb r16, 0x45(r31)
stb r16, 0x50(r31)
stb r16, 0x5A(r31)
stb r16, 0x68(r31)
stb r16, 0x73(r31)

_exitArtsUnlockedMod:
;fixes line we overwrote
or r30, r3, r3
blr

_forceArtsinCreateParty:
li r4, $check
cmpwi r4, 5
bne _exitForceArtsinCreateParty

addi r31, r31, $memoffset-0x24D
li r4, $artadr4+2
stbu r4, 1(r31)
li r4, $art4
stbu r4, 1(r31)
li r4, $artadr3+2
stbu r4, 1(r31)
li r4, $art3
stbu r4, 1(r31)
li r4, $artadr2+2
stbu r4, 1(r31)
li r4, $art2
stbu r4, 1(r31)
li r4, $artadr1+2
stbu r4, 1(r31)
li r4, $arts
stbu r4, 1(r31)
li r4, $artadr8+2
stbu r4, 1(r31)
li r4, $art8
stbu r4, 1(r31)
li r4, $artadr7+2
stbu r4, 1(r31)
li r4, $art7
stbu r4, 1(r31)
li r4, $artadr6+2
stbu r4, 1(r31)
li r4, $art6
stbu r4, 1(r31)
li r4, $artadr5+2
stbu r4, 1(r31)
li r4, $art5
stbu r4, 1(r31)

_exitForceArtsinCreateParty:
addi r3, r1, 0x8
addi r4, r29, 0x14
blr

[XCX_ArtsUnlock_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x02A923F4 = bla _ArtsMemorEU101US102
0x023428E8 = or r4, r29, r29
0x023428EC = bla _ArtsMemorEU101US102

[XCX_ArtsUnlock_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02A923E4 = bla _ArtsMemorEU101US102
0x023428E8 = or r4, r29, r29
0x023428EC = bla _ArtsMemorEU101US102

[XCX_ArtsUnlock_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02A8E95C = bla _ArtsMemorJP102
0x0234211C = or r4, r29, r29
0x02342120 = bla _ArtsMemorJP102

[XCX_ArtsUnlock_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02A92368 = bla _ArtsMemorUS100
0x02342878 = or r4, r29, r29
0x0234287C = bla _ArtsMemorUS100

[XCX_ArtsUnlock_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02A8CCA4 = bla _ArtsMemorJP100
0x02341FA8 = or r4, r29, r29
0x02341FAC = bla _ArtsMemorJP100
