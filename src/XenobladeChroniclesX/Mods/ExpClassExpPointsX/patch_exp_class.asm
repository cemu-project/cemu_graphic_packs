[XCX_CLASSEXPX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
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


[XCX_CLASSEXPX_V101E] ; ############################################################################
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x020C4A28 = bla _expBattle
0x023CC750 = bla _expSquadValue
0x023CC814 = bla _expSquadValue
0x02B91324 = bla _dispBefore
0x02B9FF44 = bla _dispAfter

[XCX_CLASSEXPX_V102U] ; ############################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U
0x020C4A28 = bla _expBattle
0x023CC750 = bla _expSquadValue
0x023CC814 = bla _expSquadValue
0x02B91314 = bla _dispBefore
0x02B9FF34 = bla _dispAfter

[XCX_CLASSEXPX_V102J] ; ############################################################################
moduleMatches = 0x7672271D ; 1.0.2J
0x020C44F4 = bla _expBattle
0x023CBDB4 = bla _expSquadValue
0x023CBE98 = bla _expSquadValue
0x02B8D260 = bla _dispBefore
0x02B9B9FC = bla _dispAfter

[XCX_CLASSEXPX_V100U] ; ############################################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x020C4A28 = bla _expBattle
0x023CC6E0 = bla _expSquadValue
0x023CC7A4 = bla _expSquadValue
0x02B91298 = bla _dispBefore
0x02B9FE44 = bla _dispAfter

[XCX_CLASSEXPX_V100J] ; ############################################################################
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x020C4270 = bla _expBattle
0x023CB8E4 = bla _expSquadValue
0x023CB9C8 = bla _expSquadValue
0x02B8AB48 = bla _dispBefore
0x02B99024 = bla _dispAfter
