[SonicBoom_DebugMode_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
.origin = codecave
; Enable sys_brbdebug
_brbdebug:
li r5, 1
bctrl
b 0x02C9B9B0

0x02C9B9AC = b _brbdebug


[SonicBoom_DebugMode_JP]
moduleMatches = 0x0D395735 ; (JP)
.origin = codecave
; Enable sys_brbdebug
_brbdebug:
li r5, 1
bctrl
b 0x02C9B990

0x02C9B98C = b _brbdebug


[SonicBoom_DebugMode_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
.origin = codecave
; Enable sys_brbdebug
_brbdebug:
li r5, 1
bctrl
b 0x02C9B958

0x02C9B954 = b _brbdebug


[SonicBoom_DebugMode_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
.origin = codecave
; Enable sys_brbdebug
_brbdebug:
li r5, 1
bctrl
b 0x02C9B978

0x02C9B974 = b _brbdebug


[SonicBoom_DebugMode_vDemo]
moduleMatches = 0xF8B127C5, 0x62EBE136 ; demo(EU/NA), demo(JP)
.origin = codecave
; Enable sys_brbdebug
_brbdebug:
li r5, 1
bctrl
b 0x02c9b970

0x02c9b96c = b _brbdebug
