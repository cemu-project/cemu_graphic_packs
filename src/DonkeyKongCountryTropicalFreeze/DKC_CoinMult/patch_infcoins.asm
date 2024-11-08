[DKCTF_MultCoins]
moduleMatches = 0xA37C99E1, 0x4FF15DD2
.origin = codecave

_addCoinsMultCheat:
or r5, r30, r30
cmpwi r29, 1
bne _addCoinsMultCheatExit

;add extra coin amount
addi r5, r30, $addamountcn-1

_addCoinsMultCheatExit:
blr

[DKCTF_MultCoins_NAv16]
moduleMatches = 0xA37C99E1
0x020A5970 = bla _addCoinsMultCheat

[DKCTF_MultCoins_NAv2]
moduleMatches = 0x4FF15DD2
0x020A5904 = bla _addCoinsMultCheat

;[DKCTF_MultCoins_EUv16]

;[DKCTF_MultCoins_EUv2]

;[DKCTF_MultCoins_JPv16]

;[DKCTF_MultCoins_JPv2]
