[SonicBoom_ForceAltConstume_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; patch AltSkinsAvailable read
0x034BB354 = li r3, 0x1
0x034BEE04 = li r3, 0x1
0x034BEE70 = li r3, 0x1
; patch AltSkinsActive read
0x034C88A8 = li r3, 0x1
; AltSkinsAvailable read
; 81 9c ?? fc 80 6c 00 98 81 83 00 00 81 8c 01 0c
; AltSkinsActive read
; 38 a0 00 00 4b ff ff 19 7c 7f 1b 78

[SonicBoom_ForceAltConstume_JP]
moduleMatches = 0x0D395735 ; (JP)
; patch AltSkinsAvailable read
0x034BB2A4 = li r3, 0x1
0x034BED48 = li r3, 0x1
0x034BEDB4 = li r3, 0x1
; patch AltSkinsActive read
0x034C884C = li r3, 0x01

[SonicBoom_ForceAltConstume_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
; patch AltSkinsAvailable read
0x034BAF58 = li r3, 0x1
0x034BE9EC = li r3, 0x1
0x034BEA58 = li r3, 0x1
; patch AltSkinsActive read
0x034C8490 = li r3, 0x1

[SonicBoom_ForceAltConstume_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
; patch AltSkinsAvailable read
0x034BAEBC = li r3, 0x1
0x034BE938 = li r3, 0x1
0x034BE9B4 = li r3, 0x1
; patch AltSkinsActive read
0x034C83DC = li r3, 0x01

[SonicBoom_ForceAltConstume_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
; patch AltSkinsAvailable read
0x034bafa8 = li r3, 0x1
0x034bea58 = li r3, 0x1
0x034beac4 = li r3, 0x1
; patch AltSkinsActive read
0x034c8554 = li r3, 0x01

[SonicBoom_ForceAltConstume_JPvDemo]
moduleMatches = 0x62EBE136 ; demo(JP)
; patch AltSkinsAvailable read
0x034bb184 = li r3, 0x1
0x034bec28 = li r3, 0x1
0x034bec94 = li r3, 0x1
; patch AltSkinsActive read
0x034c872c = li r3, 0x01
