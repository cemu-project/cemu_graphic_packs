[MarioKart8_OnlineRaceRating_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
.origin = codecave
ChangeOnlineRaceRating:
li r8, $racevr
stw r8, 0x1a20(r29)
blr

;this mod makes 0x2e6b6660 = $racevr
0x024DCE2C = bla ChangeOnlineRaceRating
