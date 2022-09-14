[XCX_NOITEMSELL_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; ----------------------------------------------------------------------------
; WHO  : addItem__Q2_3cfs9CfItemBoxSFQ3_2fw9CItemType4TypeUiRQ2_3cfs12CfItemHandle
; WHAT : instead of selling item, return 0 (no systemlog)
0x02365A94 = li r31, $mod ; sellItem
; ----------------------------------------------------------------------------
; WHO  : cfs::CfPopManagerItem::updateTouchItem((void))
; WHAT : exit code if addItem returns 0 (blue gem not collected and no sound)
0x0238A1BC = _exit:
0x02389EF8 = beq _exit

[XCX_NOITEMSELL_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x023652C8 = li r31, $mod ; sellItem
0x023899F0 = _exit:
0x0238972C = beq _exit

[XCX_NOITEMSELL_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02365A24 = li r31, $mod ; sellItem
0x0238A14C = _exit:
0x02389E88 = beq _exit

[XCX_NOITEMSELL_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02365154 = li r31, $mod ; sellItem
0x0238987C = _exit:
0x023895B8 = beq _exit
