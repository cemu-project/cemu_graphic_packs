[MarioKart8_UnlockCharacter]
moduleMatches = 0x9F0A90B7, 0xD09700CE ; v4.2(EU/NA/JP), v4.1(EU/NA/JP)
.origin = codecave

UnlockStamps:
;r11 == 0x2e6b6790
li r12, 3 ;;
li r30, 90
mtctr r30
addi r30, r11, 10-1
_forloopUnlockStamps:
 stbu r12, 1(r30)
 bdnz _forloopUnlockStamps

lbzx r30,r11,r0
blr

[MarioKart8_UnlockCharacter_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
0x024D7A6C = bla UnlockStamps

[MarioKart8_UnlockCharacter_v41]
moduleMatches = 0xD09700CE ; v4.1(EU/NA/JP)
0x024D76E8 = bla UnlockStamps
