[XCX_LOOT_MATERIALS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $ratio

; ----------------------------------------------------------------------------
; WHO  : __CPR90__calcItemBronze__Q2_8ItemDrop16CItemDropManagerFRQ3_J19JJ28J9SDropInfoUc
; WHAT : Affect the drop ratio of materials
_minDropRate:
	li r11, $ratio
	li r31, 0
	cmpwi r11, 0
	beqlr
	cmpw r31, r11 ; this value is the default drop ratio under which we want to set a new drop ratio (logically equal or greater)
	blt newdrop
	b compare
newdrop:
	mr r31, r11 ; here you set the new drop ratio
compare:
	cmpw r3, r31
	blr

; ----------------------------------------------------------------------------
; WHO  : __CPR90__calcItemBronze__Q2_8ItemDrop16CItemDropManagerFRQ3_J19JJ28J9SDropInfoUc
; WHAT : random selection when all materials at 100% and more than 5
_saveEquipCnt:
	mr r30, r4
	lwz r13, 0xE0(r30)
	blr

_fixit:
	li r12, 0
	subf r3, r13, r4 ; r13 = equipment count, r4 = all item count, r3 = material count
	li r8, 4
	subf r8, r13, r8
	cmpw r3, r8 ; slots 0 to 4-r13 are used by equipment
	blelr
	li r3, 6 ; 0 equ: rand 0 to 4+1 (+1 for chances: 4/5 = 80%)
	mflr r31
	lis r8, _mtRand@ha
	addi r8, r8, _mtRand@l
	mtctr r8
	bctrl
	mtlr r31
	add r3, r3, r13 ; 0+r13 to 4
	cmpwi r3, 4 ; r13 to 4 are the possible slots, others are ignored
	bgtlr
	mr r4, r3
	blr

[XCX_LOOT_MATERIALS_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x030FA650 = _mtRand:
0x02B09748 = nop
0x02B09788 = nop

[XCX_LOOT_MATERIALS_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x030FA654 = _mtRand:
0x02B09738 = nop
0x02B09778 = nop

[XCX_LOOT_MATERIALS_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x030FA4D4 = _mtRand:
0x02B096BC = nop
0x02B096FC = nop

[XCX_LOOT_MATERIALS_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
0x021AF5DC = bla _minDropRate ; modify drop ratio for bronze chests
0x021AF614 = bla _minDropRate ; modify drop ratio for silver chests
0x021AF5F8 = bla _minDropRate ; modify drop ratio for gold chests

0x021AF334 = bla _saveEquipCnt
0x021AF620 = bla _fixit

[XCX_LOOT_MATERIALS_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x030F5B94 = _mtRand:
0x02B05688 = nop
0x02B056C8 = nop

0x021AF0A8 = bla _minDropRate ; modify drop ratio for bronze chests
0x021AF0E0 = bla _minDropRate ; modify drop ratio for silver chests
0x021AF0C4 = bla _minDropRate ; modify drop ratio for gold chests

0x021AEE00 = bla _saveEquipCnt
0x021AF0EC = bla _fixit

[XCX_LOOT_MATERIALS_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x030F0794 = _mtRand:
0x02B03530 = nop
0x02B03570 = nop

0x021AEE24 = bla _minDropRate ; modify drop ratio for bronze chests
0x021AEE5C = bla _minDropRate ; modify drop ratio for silver chests
0x021AEE40 = bla _minDropRate ; modify drop ratio for gold chests

0x021AEB7C = bla _saveEquipCnt
0x021AEE68 = bla _fixit
