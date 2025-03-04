[MarioKart8_OnlineBattleRating_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
.origin = codecave
ChangeOnlineBattleRating:
li r10, $battlevr
stw r10, 0x1a24(r29)
blr

;this mod makes 0x2e6b6664 = $battlevr
0x024DCE58 = bla ChangeOnlineBattleRating
