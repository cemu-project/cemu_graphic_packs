[MarioKart8_UnlockCharacter]
moduleMatches = 0x9F0A90B7, 0xD09700CE ; v4.2(EU/NA/JP), v4.1(EU/NA/JP)
.origin = codecave

UnlockCharactersMod:
;r11 == 0x2e6b6690
lis r30, 0x0303
ori r30, r30, 0x0303
stw r30, 0x0(r11)
stw r30, 0x4(r11)
stw r30, 0x8(r11)
stw r30, 0xC(r11)
stw r30, 0x10(r11)
stw r30, 0x14(r11)
stw r30, 0x18(r11)
sth r30, 0x1C(r11)
lbzx r30, r11, r0
blr

[MarioKart8_UnlockCharacter_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
0x024D76AC = bla UnlockCharactersMod

[MarioKart8_UnlockCharacter_v41]
moduleMatches = 0xD09700CE ; v4.1(EU/NA/JP)
0x024D7328 = bla UnlockCharactersMod
