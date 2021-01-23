[XCX_LOOT_EQUIPMENT_COUNT]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

; ----------------------------------------------------------------------------
; WHO  : ItemDrop::CItemDropManager::calcItemNum((uchar))
; WHAT : Chances to loot multiples equipments (3 max)

0x021AB218 = li r3, $cnt3
0x021AB268 = li r3, $cnt2
0x021AB2B8 = li r3, $cnt1
