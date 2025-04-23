[MarioKart8_OnlineRaceRating_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
.origin = codecave

ChangeOnlineRaceRating:
li r12, 0x1388
lwz r8, 0x1a20(r29)
cmpw r8, r12
bgt ChangeOnlineRaceRatingExit
li r8, ChangeOnlineRaceRating@hi
xor r12, r12, r12
not r12, r12
neg r12, r12
or r30, r12, r12
add r12, r12, r12
mullw r12, r12, r12
add r8, r12, r12
mullw r12, r8, r8
add r12, r12, r12
add r12, r12, r8
mullw r8, r8, r8
mullw r30, r8, r8
add r8, r8, r8
add r8, r8, r8
add r30, r8, r30
add r8, r8, r8
add r30, r8, r30
add r8, r30, r12
ChangeOnlineRaceRatingExit:
stw r8, 0x1a20(r29)
lis r30, 0x4330
blr

0x024DCE24 = bla ChangeOnlineRaceRating
0x024dCE2C = nop
