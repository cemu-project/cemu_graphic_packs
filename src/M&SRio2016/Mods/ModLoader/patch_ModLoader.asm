[MarioSonicRio2016_ModLoader]
moduleMatches = 0xD44C22E3, 0xE0E2BBA7 ; (EU/NA), (JP)
0x02003110 = li r0, 0x10  ; Lower priority of unison_0.cpk
0x0291B17C = li r12, 1    ; Enable loading game files from raw directory
; Rename raw to mod
0x10000C74 = .byte 0x6D
0x10000C75 = .byte 0x6F
0x10000C76 = .byte 0x64

[MarioSonicRio2016_ModLoader_vDemo]
moduleMatches = 0x60481B3F ; demo(EU/JP)
0x02003118 = li r0, 0x10  ; Lower priority of unison_0.cpk
0x0276BDF0 = li r12, 1    ; Enable loading game files from raw directory
; Rename raw to mod
0x10000C7C = .byte 0x6D
0x10000C7D = .byte 0x6F
0x10000C7E = .byte 0x64
