[DKCTF_MultLives]
moduleMatches = 0xA37C99E1, 0x4FF15DD2 ; v16(EU/NA/JP), v2(EU/NA/JP)
.origin = codecave

_addLivesMultCheat:
cmpwi r29, 8
bne _addLivesMultCheatExit

;add extra lives amount
addi r5, r30, $addamountliv-1

_addLivesMultCheatExit:
;restore line we overwrote
or r3, r27, r27
blr

[DKCTF_MultLives_NAv16]
moduleMatches = 0xA37C99E1 ; v16(EU/NA/JP)
0x020A5978 = bla _addLivesMultCheat

[DKCTF_MultLives_NAv2]
moduleMatches = 0x4FF15DD2 ; v2(EU/NA/JP)
0x020A590C = bla _addLivesMultCheat
