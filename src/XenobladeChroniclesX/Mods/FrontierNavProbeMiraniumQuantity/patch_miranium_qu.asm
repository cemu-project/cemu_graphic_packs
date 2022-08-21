[XCX_FN_MIR_QTY]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mod
.int $uncap

; ----------------------------------------------------------------------------
; WHO  : changeTime__Q2_4fnet9CFnetTaskFUiT1
; WHAT : Affect the quantity of the NavFrontier income for the Miranium
_miranium:
lwzx r31, r3, r28
li r4, $mod
mullw r31, r31, r4
blr

; ----------------------------------------------------------------------------
; WHO  : fnet::CFnetData::toStorage(const(unsigned int))
; WHAT : Ignore max quantity
_getMiranium:
li r12, $uncap
cmpwi r12, 0
addis r12, r30, 1
beqlr
li r3, 0
blr

_ignoreMax:
li r12, $uncap
cmpwi r12, 1
beqlr
mr r31, r0
blr


[XCX_FN_MIR_QTY_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x027D526C = bla _miranium
0x027D0FF8 = bla _getMiranium
0x027D1030 = bla _ignoreMax

[XCX_FN_MIR_QTY_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027D2EA4 = bla _miranium
0x027CEC30 = bla _getMiranium
0x027CEC68 = bla _ignoreMax

[XCX_FN_MIR_QTY_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027D520C = bla _miranium
0x027D0F98 = bla _getMiranium
0x027D0FD0 = bla _ignoreMax

[XCX_FN_MIR_QTY_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027D1EA0 = bla _miranium
0x027CDC2C = bla _getMiranium
0x027CDC64 = bla _ignoreMax
