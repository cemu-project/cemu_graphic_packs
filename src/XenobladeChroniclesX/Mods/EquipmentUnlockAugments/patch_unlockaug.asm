[XCX_UNLOCKAUGMENTS_ALL] ################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

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

[XCX_UNLOCKAUGMENTS_1E] ################################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

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

[XCX_UNLOCKAUGMENTS_2U] ################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

0x02A81790 = li r3, 0
0x02A817B8 = li r3, $checkIgnoreMiranium
0x02A81A2C = li r3, $checkIgnoreMaterials

0x02A813F4 = bla ChangeMaterialsQuantity
0x02A813F8 = cmpwi r31, 0
0x02A81468 = bla ChangeMaterialsQuantity
0x02A814D4 = bla ChangeMaterialsQuantity

[XCX_UNLOCKAUGMENTS_1U] ################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x02A81714 = li r3, 0
0x02A8173C = li r3, $checkIgnoreMiranium
0x02A819B0 = li r3, $checkIgnoreMaterials

0x02A81378 = bla ChangeMaterialsQuantity
0x02A8137C = cmpwi r31, 0
0x02A813EC = bla ChangeMaterialsQuantity
0x02A81458 = bla ChangeMaterialsQuantity
