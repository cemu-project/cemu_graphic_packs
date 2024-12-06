[DKCTF_MultCoins]
moduleMatches = 0xA37C99E1, 0x4FF15DD2 ; (EU/NA/JP)v16, (EU/NA/JP)v2
.origin = codecave

_addCoinsMultCheat:
or r5, r30, r30
cmpwi r29, 1
bne _addCoinsMultCheatExit

;add extra coin amount
addi r5, r30, $addamountcn-1

_addCoinsMultCheatExit:
blr

[DKCTF_MultCoins_v16]
moduleMatches = 0xA37C99E1 ; (EU/NA/JP)v16
0x020A5970 = bla _addCoinsMultCheat

[DKCTF_MultCoins_v2]
moduleMatches = 0x4FF15DD2 ; (EU/NA/JP)v2
0x020A5904 = bla _addCoinsMultCheat
