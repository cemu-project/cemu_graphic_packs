[XCX_UPGRADENOLIMIT]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
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


[XCX_UPGRADENOLIMIT_V101E] ; ################################################################
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
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

[XCX_UPGRADENOLIMIT_V102U] ; ################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02A6DC98 = li r3, 0
0x02A6DFEC = li r3, $checkSelectItem

0x02A72124 = li r10, 99
0x02A723A4 = li r3, $checkStrengthen

0x02A71F28 = bla SaveUpgradeCount
0x02A7217C = bla CtrlUpgradeCount

[XCX_UPGRADENOLIMIT_V102J] ; ################################################################
moduleMatches = 0x7672271D ; 1.0.2J
0x02A6A210 = li r3, 0 ; Ignore upgrades counter
0x02A6A564 = li r3, $checkSelectItem

0x02A6E69C = li r10, 99 ; Ignore upgrades counter
0x02A6E91C = li r3, $checkStrengthen

0x02A6E4A0 = bla SaveUpgradeCount
0x02A6E6F4 = bla CtrlUpgradeCount

[XCX_UPGRADENOLIMIT_V100U] ; ################################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02A6DC1C = li r3, 0 ; Ignore upgrades counter
0x02A6DF70 = li r3, $checkSelectItem

0x02A720A8 = li r10, 99 ; Ignore upgrades counter
0x02A72328 = li r3, $checkStrengthen

0x02A71EAC = bla SaveUpgradeCount
0x02A72100 = bla CtrlUpgradeCount

[XCX_UPGRADENOLIMIT_V100J] ; ################################################################
moduleMatches = 0x785CA8A9 ; 1.0.0J

0x02A686DC = li r3, 0 ; Ignore upgrades counter
0x02A68A30 = li r3, $checkSelectItem

0x02A6CB2C = li r10, 99 ; Ignore upgrades counter
0x02A6CDAC = li r3, $checkStrengthen

0x02A6C930 = bla SaveUpgradeCount
0x02A6CB84 = bla CtrlUpgradeCount
