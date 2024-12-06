[DKCTF_MultBanana]
moduleMatches = 0xA37C99E1, 0x4FF15DD2 ; (EU/NA/JP)v16, (EU/NA/JP)v2
.origin = codecave

_addBananaMultCheat:
cmpwi r29, 15
bne _addBananaMultCheatExit

;add extra banana amount
lwz r4, 0x4 (r27)
addi r4, r4, $addamountbna-1
stw r4, 0x4 (r27)

_addBananaMultCheatExit:
;restore line we overwrote
or r4, r29, r29
blr

[DKCTF_MultBanana_v16]
moduleMatches = 0xA37C99E1 ; (EU/NA/JP)v16
0x020A5974 = bla _addBananaMultCheat

[DKCTF_MultBanana_v2]
moduleMatches = 0x4FF15DD2 ; (EU/NA/JP)v2
0x020A5908 = bla _addBananaMultCheat
