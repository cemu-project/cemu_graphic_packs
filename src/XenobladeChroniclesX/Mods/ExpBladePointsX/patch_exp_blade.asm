[XCX_BLADEX]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mod
; ----------------------------------------------------------------------------
; WHO  : fw::SocialUnion::getUnionBasePoint((int))
; WHAT : Multiply the BLADE points rewarded

[XCX_BLADEX_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x0288E610 = nop
0x02E0C5B0 = li r3, -1
0x0288E614 = li r3, $mod

[XCX_BLADEX_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x0288E610 = nop
0x02E0C550 = li r3, -1
0x0288E614 = li r3, $mod

[XCX_BLADEX_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x0288B470 = nop
0x02E07A78 = li r3, -1
0x0288B474 = li r3, $mod

[XCX_BLADEX_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0288E594 = nop
0x02E0C3D8 = li r3, -1
0x0288E598 = li r3, $mod

;[XCX_BLADEX_V100J]
;moduleMatches = 0x785CA8A9 ; 1.0.0J ;;;
;getUnionBasePoint__Q2_2fw11SocialUnionFi does not exist
