[XCX_FN_MIR_QTY_ALL] ######################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $mod

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

.int $uncap

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

[XCX_FN_MIR_QTY] ######################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x027D526C = bla _miranium
0x027D0FF8 = bla _getMiranium
0x027D1030 = bla _ignoreMax

[XCX_FN_MIR_QTY_1U] ######################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x027D520C = bla _miranium
0x027D0F98 = bla _getMiranium
0x027D0FD0 = bla _ignoreMax
