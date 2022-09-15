[XCX_LOOT_EQUIPMENT_BESTQUALITY_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
; ------------------------------------------------------------------------
; WHO  : __CPR98__calcItemTableID__Q2_8ItemDrop16CItemDropManagerFUcRCQ3_J20JJ29J11SCreateInfoRUs
; WHAT : Always best equipment looted (X6X)
0x021AD710 = nop ; ground weapons ?
0x021ADA6C = nop ; ground armors
0x021ADDE8 = nop ; skell weapons
0x021AE164 = nop ; skell armors
; ------------------------------------------------------------------------
; WHO  : ItemDrop::CItemDropManager::calcAfxSltNum((unsigned short))
; WHAT : Control of the loot quality (always orange/yellow)
0x021AEE7C = li r3, $traits ; num of gear traits
0x021AF280 = li r3, $slots ; num of gear slots

[XCX_LOOT_EQUIPMENT_BESTQUALITY_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021AD1DC = nop ; ground weapons ?
0x021AD538 = nop ; ground armors
0x021AD8B4 = nop ; skell weapons
0x021ADC30 = nop ; skell armors

0x021AE948 = li r3, $traits ; num of gear traits
0x021AED4C = li r3, $slots ; num of gear slots

[XCX_LOOT_EQUIPMENT_BESTQUALITY_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021ACF58 = nop ; ground weapons ?
0x021AD2B4 = nop ; ground armors
0x021AD630 = nop ; skell weapons
0x021AD9AC = nop ; skell armors

0x021AE6C4 = li r3, $traits ; num of gear traits
0x021AEAC8 = li r3, $slots ; num of gear slots
