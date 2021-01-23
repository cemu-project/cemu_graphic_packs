[XCX_CLASSEXPX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $mod

; ----------------------------------------------------------------------------
; WHO  : addClassExpChara__Q2_6Battle14CBattleManagerFUiT1
; WHAT : Multiply the class experience given during combat

_expBattle:
li r12, $mod
mullw r31, r3, r12
blr

; ----------------------------------------------------------------------------
; WHO  : addReward__Q2_3cfs11CfSquadUtilSFUiT1
; WHAT : Multiply the experience points given by Squad missions

_expSquadValue:
li r4, $mod
mullw r3, r3, r4
stw r3, 0x18(r1)
blr

_dispBefore:
li 	   r5, $mod
mullw     r3, r3, r5
stw	   r3, 0x34(r1)
blr

; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestResult::setup((void))
; WHAT : 

_dispAfter:
li 	   r5, $mod
mullw     r3, r3, r5
stw 	   r3, 0x80(r1)
blr

[XCX_CLASSEXPX_1E] ############################################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

0x020C4A28 = bla _expBattle
0x023CC750 = bla _expSquadValue
0x023CC814 = bla _expSquadValue
0x02B91324 = bla _dispBefore
0x02B9FF44 = bla _dispAfter

[XCX_CLASSEXPX_2U] ############################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

0x020C4A28 = bla _expBattle
0x023CC750 = bla _expSquadValue
0x023CC814 = bla _expSquadValue
0x02B91314 = bla _dispBefore
0x02B9FF34 = bla _dispAfter

[XCX_CLASSEXPX_1U] ############################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x020C4A28 = bla _expBattle
0x023CC6E0 = bla _expSquadValue
0x023CC7A4 = bla _expSquadValue
0x02B91298 = bla _dispBefore
0x02B9FE44 = bla _dispAfter
