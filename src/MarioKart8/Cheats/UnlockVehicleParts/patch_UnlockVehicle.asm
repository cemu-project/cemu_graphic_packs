[MarioKart8_UnlockVehicle]
moduleMatches = 0x9F0A90B7, 0xD09700CE ; v4.2(EU/NA/JP), v4.1(EU/NA/JP)
.origin = codecave

CheckandChangeCoinAmmount:
lwz r0, 0x14e0(r26)
cmpwi r0, $coinammount
bge CheckandChangeCoinAmmount_Exit
li r0, $coinammount
stw r0, 0x14e0(r26)
CheckandChangeCoinAmmount_Exit:
blr

[MarioKart8_UnlockVehicle_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
;this mod makes 0x2e6b6128 = $coinammount
0x025A4038 = bla CheckandChangeCoinAmmount

[MarioKart8_UnlockVehicle_v41]
moduleMatches = 0xD09700CE ; v4.1(EU/NA/JP)
0x025A3E84 = bla CheckandChangeCoinAmmount
