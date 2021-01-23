[XCX_EXPX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $mod

; ----------------------------------------------------------------------------
; WHO  : cfs::CfCompoCtrlEnemy::execRequestCommon
; WHAT : Multiply the experience points given in battles

_expBattle:
lwz r3, 0x3184(r28)
mulli r3, r3, $mod
stw r3, 0x3184(r28)
mr r3, r28
blr

; ----------------------------------------------------------------------------
; WHO  : addTreasure__Q2_3cfs10CfTBoxUtilSFUib
; WHAT : Multiply the experience points given by treasures or exploration

_expTreasure:
li r3, $mod
lhz r31, 0x1C(r1)
mullw r31, r31, r3
blr

; ----------------------------------------------------------------------------
; WHO  : addReward__Q2_3cfs11CfQuestUtilSFUiQ2_3cfs17CfQuestRewardType
; WHAT : Multiply the experience points given by quests ?

_expQuest:
li r4, $mod
mullw r3, r3, r4
stw r3, 0x60(r1)
blr

; ----------------------------------------------------------------------------
; WHO  : addReward__Q2_3cfs11CfSquadUtilSFUiT1
; WHAT : Multiply the experience points given by Squad missions

_expSquadValue:
li r4, $mod
mullw r3, r3, r4
stw r3, 0x10(r1)
blr

; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestInfoWindow::displayInfo((menu::MenuObject *,bool))
; WHAT : 

_dispBefore:
lwz       r23, 0x88(r1)
li        r24, $mod
mullw     r23, r23, r24
blr

; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestResult::setup((void))
; WHAT : 

_dispAfter:
li  	   r5, $mod
mullw     r3, r3, r5
stw 	   r3, 0x78(r1)
blr

[XCX_EXPX_1E] ############################################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

0x025624D4 = bla _expBattle
0x022D8E64 = bla _expTreasure
0x0229560C = bla _expQuest
0x023CC6D4 = bla _expSquadValue
0x02B94700 = bla _dispBefore
0x02B9FDD4 = bla _dispAfter

; TEST : unlimited exp (no 9999 limit) up to 65535?
0x020C1BC4 = nop

[XCX_EXPX_2U] ############################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

0x025624D4 = bla _expBattle
0x022D8E64 = bla _expTreasure
0x0229560C = bla _expQuest
0x023CC6D4 = bla _expSquadValue
0x02B946F0 = bla _dispBefore
0x02B9FDC4 = bla _dispAfter

; TEST : unlimited exp (no 9999 limit) up to 65535?
0x020C1BC4 = nop

[XCX_EXPX_1U] ############################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x02562464 = bla _expBattle
0x022D8DF4 = bla _expTreasure
0x0229559C = bla _expQuest
0x023CC664 = bla _expSquadValue
0x02B94674 = bla _dispBefore
0x02B9FCD4 = bla _dispAfter

; TEST : unlimited exp (no 9999 limit) up to 65535?
0x020C1BC4 = nop
