[XCX_UPGRADENOLIMIT_ALL] ################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $checkSelectItem
.int $checkStrengthen

VarUpgradeCount:
.int 0

SaveUpgradeCount:
lis r30, VarUpgradeCount@ha
stw r12, VarUpgradeCount@l(r30)
mr r30, r3
blr

CtrlUpgradeCount:
cmpwi r3, 0
beqlr
lis r3, VarUpgradeCount@ha
lwz r3, VarUpgradeCount@l(r3)
cmpwi r3, 0xF
blr

[XCX_UPGRADENOLIMIT_1E] ################################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

; ----------------------------------------------------------------------------
; WHO  : menu::MenuArmsCompanyAffixSelectItem::CheckAffixStrengthen
; WHAT : Unlimited upgrades (equipment selection menu)

0x02A6DCA8 = li r3, 0 ; Ignore upgrades counter
0x02A6DFFC = li r3, $checkSelectItem

; ----------------------------------------------------------------------------
; WHO  : menu::MenuArmsCompanyAffixStrengthen::CheckAffixStrengthen
; WHAT : Unlimited upgrades (affix selection menu)

0x02A72134 = li r10, 99 ; Ignore upgrades counter
0x02A723B4 = li r3, $checkStrengthen

0x02A71F38 = bla SaveUpgradeCount
0x02A7218C = bla CtrlUpgradeCount

[XCX_UPGRADENOLIMIT_2U] ################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U


0x02A6DC98 = li r3, 0
0x02A6DFEC = li r3, $checkSelectItem

0x02A72124 = li r10, 99
0x02A723A4 = li r3, $checkStrengthen

0x02A71F28 = bla SaveUpgradeCount
0x02A7217C = bla CtrlUpgradeCount

[XCX_UPGRADENOLIMIT_1U] ################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x02A6DC1C = li r3, 0 ; Ignore upgrades counter
0x02A6DF70 = li r3, $checkSelectItem

0x02A720A8 = li r10, 99 ; Ignore upgrades counter
0x02A72328 = li r3, $checkStrengthen

0x02A71EAC = bla SaveUpgradeCount
0x02A72100 = bla CtrlUpgradeCount
