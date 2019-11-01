[XCX_LOOT_EQUIPMENT_BESTQUALITY]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

; ----------------------------------------------------------------------------
; WHO  : __CPR98__calcItemTableID__Q2_8ItemDrop16CItemDropManagerFUcRCQ3_J20JJ29J11SCreateInfoRUs
; WHAT : Always best equipment looted (X6X)

0x021AD710 = nop ; ground weapons ?
0x021ADA6C = nop ; ground armors
0x021ADDE8 = nop ; skell weapons
0x021AE164 = nop ; skell armors

; ----------------------------------------------------------------------------
; WHO  : ItemDrop::CItemDropManager::calcAfxSltNum((unsigned short))
; WHAT : Control of the loot quality (always orange/yellow)

0x021AEE7C = li r3, 3
0x021AF280 = li r3, 3
