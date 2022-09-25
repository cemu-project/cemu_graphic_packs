[XCX_LOOT_EQUIPMENT_COUNT_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
; ----------------------------------------------------------------------------
; WHO  : ItemDrop::CItemDropManager::calcItemNum((uchar))
; WHAT : Chances to loot multiples equipments (3 max)
0x021AB218 = li r3, $cnt3
0x021AB268 = li r3, $cnt2
0x021AB2B8 = li r3, $cnt1

[XCX_LOOT_EQUIPMENT_COUNT_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021AACE4 = li r3, $cnt3
0x021AAD34 = li r3, $cnt2
0x021AAD84 = li r3, $cnt1

[XCX_LOOT_EQUIPMENT_COUNT_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021AAA60 = li r3, $cnt3
0x021AAAB0 = li r3, $cnt2
0x021AAB00 = li r3, $cnt1
