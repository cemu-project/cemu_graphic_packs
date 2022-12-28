; AltSkinsAvailable read
; 81 9c ?? fc 80 6c 00 98 81 83 00 00 81 8c 01 0c

; AltSkinsActive read
; 38 a0 00 00 4b ff ff 19 7c 7f 1b 78


[WiiULauncher0US]
moduleMatches = 0x90DAC5CE

; patch AltSkinsAvailable read
0x34BAEBC = li r3, 0x1
0x34BE938 = li r3, 0x1
0x34BE9B4 = li r3, 0x1

; patch AltSkinsActive read
0x34C83DC = li r3, 0x01


[WiiULauncher0EU]
moduleMatches = 0x8F7D2702

; patch AltSkinsAvailable read
0x34BAF58 = li r3, 0x1
0x34BE9EC = li r3, 0x1
0x34BEA58 = li r3, 0x1

; patch AltSkinsActive read
0x34C8490 = li r3, 0x1


[WiiULauncher0JP]
moduleMatches = 0x0D395735

; patch AltSkinsAvailable read
0x34BB2A4 = li r3, 0x1
0x34BED48 = li r3, 0x1
0x34BEDB4 = li r3, 0x1

; patch AltSkinsActive read
0x34C884C = li r3, 0x01


[WiiULauncher16]
moduleMatches = 0x113CC316

; patch AltSkinsAvailable read
0x34BB354 = li r3, 0x1
0x34BEE04 = li r3, 0x1
0x34BEE70 = li r3, 0x1

; patch AltSkinsActive read
0x34C88A8 = li r3, 0x1
