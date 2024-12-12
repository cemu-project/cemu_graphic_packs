[FastRacingNeo_StaticFPS_v65]
moduleMatches = 0xFAB25E0C ; v65(EU/NA/JP)
0x1000AE10 = .float $targetFPS ;Game Speed
0x1000008C = .float 60/$targetFPS ;Animated Objects and Effects Speed
0x10000090 = .double $targetFPS ;GUI Transition Speed

[FastRacingNeo_StaticFPS_v2]
moduleMatches = 0xF51F0243, 0x595D81AD ; v2(EU/NA), v0(JP)
0x1000AA40 = .float $targetFPS ;Game Speed
0x1000008C = .float 60/$targetFPS ;Animated Objects and Effects Speed
0x10000090 = .double $targetFPS ;GUI Transition Speed
