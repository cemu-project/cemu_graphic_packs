[XCX_FN_MIR_FREQ]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
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


[XCX_FN_MIR_FREQ_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x027D5250 = bla _miranium

[XCX_FN_MIR_FREQ_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027D2E88 = bla _miranium

[XCX_FN_MIR_FREQ_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027D51F0 = bla _miranium

[XCX_FN_MIR_FREQ_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027D1E84 = bla _miranium
