[XCX_EquipAnyWeapon_v101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
; WHO  : checkEquipConditionInner__Q2_4menu13MenuEquipUtilSFRCQ2_2fw7SPcDataiT2bPi
; WHAT : forces the equipment check to always return true. (can equip any level of gear, and can equip any weapon) (does not affect skells)
0x02CC4428 = li r3, 1

; WHO  : _checkWeapon__Q2_4Arts14CArtsControlPcFi
; WHAT : Allows any weapon to use any art. 99% of the time this crashes the game, but could be useful for a "have 2 melee/ranged weapons equiped mod"
;0x0269DCA8 = blr

[XCX_EquipAnyWeapon_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02CC43C8 = li r3, 1
;0x0269DCA8 = blr

[XCX_EquipAnyWeapon_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02CBF920 = li r3, 1
;0x0269D284 = blr

[XCX_EquipAnyWeapon_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02CC4250 = li r3, 1
;0x0269DC38 = blr

[XCX_EquipAnyWeapon_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02CBB62C = li r3, 1
;0x0269C7A8 = blr
