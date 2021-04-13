[WiiULauncher0]
moduleMatches = 0x90DAC5CE

; Enable sys_brbdebug
.origin = codecave
DevLevelSelect:
li r5, 1
bctrl
b 0x02C9B978

0x02C9B974 = b DevLevelSelect

[WiiULauncher16]
moduleMatches = 0x113CC316

; Enable sys_brbdebug
.origin = codecave
DevLevelSelect:
li r5, 1
bctrl
b 0x02C9B9B0

0x02C9B9AC = b DevLevelSelect
