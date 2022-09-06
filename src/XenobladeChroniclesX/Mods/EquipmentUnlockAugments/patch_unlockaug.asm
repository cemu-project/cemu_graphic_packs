[XCX_UNLOCKAUGMENTS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $checkIgnoreMiranium
.int $checkIgnoreMaterials

ChangeMaterialsQuantity:
	stw r3, 0xC(r1)
	lbz r3, 0xC(r1)
	cmpwi r3, 32
	blt next_cmq
	li r3, 12
next_cmq:
	cmpwi r3, 16
	blt exit_cmq
	li r3, 10
exit_cmq:
	stb r3, 0xC(r1)
	blr


[XCX_UNLOCKAUGMENTS_V101E] ; ################################################################
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
; ----------------------------------------------------------------------------
; WHO  : menu::MenuArmsCompanyDeviceList::CheckEnableCreateByDeviceID
; WHAT : Unlimited augments
0x02A817A0 = li r3, 0 ; all augments are known
0x02A817C8 = li r3, $checkIgnoreMiranium ; ignore miranium requirement
0x02A81A3C = li r3, $checkIgnoreMaterials ; ignore materials requirement

0x02A81404 = bla ChangeMaterialsQuantity
0x02A81408 = cmpwi r31, 0
0x02A81478 = bla ChangeMaterialsQuantity
0x02A814E4 = bla ChangeMaterialsQuantity

[XCX_UNLOCKAUGMENTS_V102U] ; ################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02A81790 = li r3, 0
0x02A817B8 = li r3, $checkIgnoreMiranium
0x02A81A2C = li r3, $checkIgnoreMaterials

0x02A813F4 = bla ChangeMaterialsQuantity
0x02A813F8 = cmpwi r31, 0
0x02A81468 = bla ChangeMaterialsQuantity
0x02A814D4 = bla ChangeMaterialsQuantity

[XCX_UNLOCKAUGMENTS_V102J] ; ################################################################
moduleMatches = 0x7672271D ; 1.0.2J
0x02A7DD08 = li r3, 0
0x02A7DD30 = li r3, $checkIgnoreMiranium
0x02A7DFA4 = li r3, $checkIgnoreMaterials

0x02A7D96C = bla ChangeMaterialsQuantity
0x02A7D970 = cmpwi r31, 0
0x02A7D9E0 = bla ChangeMaterialsQuantity
0x02A7DA4C = bla ChangeMaterialsQuantity

[XCX_UNLOCKAUGMENTS_V100U] ; ################################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02A81714 = li r3, 0
0x02A8173C = li r3, $checkIgnoreMiranium
0x02A819B0 = li r3, $checkIgnoreMaterials

0x02A81378 = bla ChangeMaterialsQuantity
0x02A8137C = cmpwi r31, 0
0x02A813EC = bla ChangeMaterialsQuantity
0x02A81458 = bla ChangeMaterialsQuantity

[XCX_UNLOCKAUGMENTS_V100J] ; ################################################################
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02A7C108 = li r3, 0
0x02A7C130 = li r3, $checkIgnoreMiranium
0x02A7C3A4 = li r3, $checkIgnoreMaterials

0x02A7BD6C = bla ChangeMaterialsQuantity
0x02A7BD70 = cmpwi r31, 0
0x02A7BDE0 = bla ChangeMaterialsQuantity
0x02A7BE4C = bla ChangeMaterialsQuantity
