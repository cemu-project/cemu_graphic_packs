[XCX_FN_MNY_FREQ]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

.int $mod

; ----------------------------------------------------------------------------
; WHAT : changeTime__Q2_4fnet9CFnetTaskFUiT1
; WHY  : Affect the frequency of the NavFrontier income for the money
;        Frequency unit is 1 minute (so by default income is every 15 minutes)

0x027D554C = li r12, $mod

[XCX_FN_MNY_FREQ_1U] ######################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

.origin = codecave

.int $mod

0x027D54EC = li r12, $mod