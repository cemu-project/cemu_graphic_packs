[XCX_BLADEX]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

.int $mod

; ----------------------------------------------------------------------------
; WHO  : fw::SocialUnion::getUnionBasePoint((int))
; WHAT : Multiply the BLADE points rewarded

0x0288E610 = nop
0x0288E614 = li r3, $mod

[XCX_BLADEX_1U] ######################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

.origin = codecave

.int $mod

0x0288E594 = nop
0x0288E598 = li r3, $mod