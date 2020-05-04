[StaticFPS_v65]
moduleMatches = 0xfab25e0c

0x1000AE10 = .float $targetFPS # Game Speed
0x1000008C = .float 60/$targetFPS # Animated Objects and Effects Speed
0x10000090 = .double $targetFPS # GUI Transition Speed
