[XCX_FN_MIR_FREQ_ALL]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $mod

; ----------------------------------------------------------------------------
; WHAT : changeTime__Q2_4fnet9CFnetTaskFUiT1
; WHY  : Affect the frequency of the FrontierNav income for the Miranium
;        Frequency unit is 1 minute (so by default income is every 30 minutes)

_miranium:
li r8, $mod
addi      r10, r3, 1
divwu     r0, r10, r8
mullw     r0, r0, r8
subf      r3, r0, r10
cmpwi     r3, 0
blr

[XCX_FN_MIR_FREQ] ##################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x027D5250 = bla _miranium

[XCX_FN_MIR_FREQ_1U] ##################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x027D51F0 = bla _miranium