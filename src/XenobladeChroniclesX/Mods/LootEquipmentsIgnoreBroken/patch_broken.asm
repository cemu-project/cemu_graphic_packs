[XCX_LOOT_EQUIPMENT_BROKEN_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
; ----------------------------------------------------------------------------
; WHO  : __CPR129__calcItem__Q2_8ItemDrop16CItemDropManagerFRQ3_J13JJ22J9SDropInfoUcRCQ3_J13JJ22J11SCreateInfo
; WHAT : Remove broken equipment
0x021AEBE0 = li r3, $mod ; Nothing is broken

[XCX_LOOT_EQUIPMENT_BROKEN_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021AE6AC = li r3, $mod

[XCX_LOOT_EQUIPMENT_BROKEN_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021AE428 = li r3, $mod
