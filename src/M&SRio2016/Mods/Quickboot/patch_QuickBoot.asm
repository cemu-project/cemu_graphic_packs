[MarioSonicRio2016_QuickBoot]
moduleMatches = 0xD44C22E3, 0xE0E2BBA7 ; (EU/NA), (JP)
0x0255C4A4 = li r3, $state ; StateSaveInit now goes to whatever is chosen in Cemu (previously StateAdvertise)

[MarioSonicRio2016_QuickBoot_vDemo]
moduleMatches = 0x60481B3F ; demo(EU/JP)
0x02558F18 = li r3, $state
