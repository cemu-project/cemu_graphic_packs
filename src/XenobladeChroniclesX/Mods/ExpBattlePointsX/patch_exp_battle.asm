[XCX_BATTLEPOINTSX_ALL] ############################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $mod

; ----------------------------------------------------------------------------
; WHO  : addClassExpChara__Q2_6Battle14CBattleManagerFUiT1
; WHAT : Multiply the battle points gained when a new class level is reached

_exp:
li r3, $mod
mullw r0, r0, r3
mulli r0, r0, 3
blr

; ----------------------------------------------------------------------------
; WHO  : addInnerExpChara__Q2_6Battle14CBattleManagerFUiN21
; WHAT : Multiply the battle points gained when a new level is reached

_exp2:
li r4, $mod
mullw r9, r9, r4
add r11, r11, r9
blr

; ----------------------------------------------------------------------------
; WHO  : addTreasure__Q2_3cfs10CfTBoxUtilSFUib
; WHAT : Multiply the battle points given by treasures or exploration

_expTreasure:
li r3, $mod
mullw r3, r31, r3
blr

; ----------------------------------------------------------------------------
; WHO  : addReward__Q2_3cfs11CfSquadUtilSFUiT1
; WHAT : Multiply the experience points given by Squad missions

_expSquadValue:
li r4, $mod
mullw r3, r3, r4
stw r3, 0x1C(r1)
blr

; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestInfoWindow::displayInfo((menu::MenuObject *,bool))
; WHAT : Multiply the battle points displayed in quest popup information.

_dispBefore:
lhz       r24, 0x90(r1)
li	      r25, $mod
mullw     r24, r24, r25
blr

; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestResult::setup((void))
; WHAT : Multiply the battle points displayed in quest popup results.

_dispAfter:
li	      r5, $mod
mullw     r3, r3, r5
stw 	  r3, 0x7C(r1)
blr

[XCX_BATTLEPOINTSX_1E] ############################################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

0x020C4A74 = bla _exp
0x020C1C48 = bla _exp2
0x022D8EDC = bla _expTreasure
0x023CC770 = bla _expSquadValue
0x023CC834 = bla _expSquadValue
0x02B94730 = bla _dispBefore
0x02B9FEE0 = bla _dispAfter

[XCX_BATTLEPOINTSX_2U] ############################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

.origin = codecave

0x020C4A74 = bla _exp
0x020C1C48 = bla _exp2
0x022D8EDC = bla _expTreasure
0x023CC770 = bla _expSquadValue
0x023CC834 = bla _expSquadValue
0x02B94720 = bla _dispBefore
0x02B9FED0 = bla _dispAfter

[XCX_BATTLEPOINTSX_1U] ############################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x020C4A74 = bla _exp
0x020C1C48 = bla _exp2
0x022D8E6C = bla _expTreasure
0x023CC700 = bla _expSquadValue
0x023CC700 = bla _expSquadValue
0x02B946A4 = bla _dispBefore
0x02B9FDE0 = bla _dispAfter
