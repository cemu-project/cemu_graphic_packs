[XCX_LOOT_MATERIALS_1E2U]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x030FA650 = _mtRand:

0x02B09748 = nop
0x02B09788 = nop

[XCX_LOOT_MATERIALS_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x030FA4D4 = _mtRand:

[XCX_LOOT_MATERIALS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

; ----------------------------------------------------------------------------
; WHO  : __CPR90__calcItemBronze__Q2_8ItemDrop16CItemDropManagerFRQ3_J19JJ28J9SDropInfoUc
; WHAT : Affect the drop ratio of materials

.int $ratio

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

0x021AF5DC = bla _minDropRate ; modify drop ratio for bronze chests
0x021AF614 = bla _minDropRate ; modify drop ratio for silver chests
0x021AF5F8 = bla _minDropRate ; modify drop ratio for gold chests

; ----------------------------------------------------------------------------
; WHO  : __CPR90__calcItemBronze__Q2_8ItemDrop16CItemDropManagerFRQ3_J19JJ28J9SDropInfoUc
; WHAT : random selection when all materials at 100% and more than 5

_saveEquipCnt:
	mr r30, r4
	lwz r13, 0xE0(r30)
	blr
0x021AF334 = bla _saveEquipCnt

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

0x021AF620 = bla _fixit
