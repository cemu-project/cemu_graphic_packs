[WiiULauncher0US]
moduleMatches = 0x90DAC5CE

; Enable sys_brbdebug
.origin = codecave
DevLevelSelect:
li r5, 1
bctrl
b 0x2C9B978

0x2C9B974 = b DevLevelSelect

[WiiULauncher0EU]
moduleMatches = 0x8F7D2702

; Enable sys_brbdebug
.origin = codecave
DevLevelSelect:
li r5, 1
bctrl
b 0x2C9B958

0x2C9B954 = b DevLevelSelect

[WiiULauncher0JP]
moduleMatches = 0x0D395735

; Enable sys_brbdebug
.origin = codecave
DevLevelSelect:
li r5, 1
bctrl
b 0x2C9B990

0x2C9B98C = b DevLevelSelect

[WiiULauncher16]
moduleMatches = 0x113CC316

; Enable sys_brbdebug
.origin = codecave
DevLevelSelect:
li r5, 1
bctrl
b 0x2C9B9B0

0x2C9B9AC = b DevLevelSelect
