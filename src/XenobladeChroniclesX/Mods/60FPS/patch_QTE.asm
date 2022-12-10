[XCX_FPS++_QTE_General]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

timingFloatConv:
timingFloatConvHa:
.uint 0
timingFloatConvL:
.uint 0

correctedTimingTemp:
correctedTimingTempHa:
.uint 0
correctedTimingTempL:
.uint 1


_justFrame1:
    lwz r12, 0x47C(r29)

    ; Convert timing to floating point for multiplication
    xoris r12, r12, 0x8000
    lis r27, timingFloatConv@ha
    stw r12, timingFloatConv@l+0x4(r27)
    lis r12, 0x4330
    stw r12, timingFloatConv@l+0x0(r27)
    lfd f13, timingFloatConv@l+0x0(r27)
    lis r27, convSub@ha
    lfd f0, convSub@l(r27)
    fsub f13, f13, f0
    frsp f13, f13

    ; Multiply timing
    lis r27, averageFPS1@ha
    lfs f0, averageFPS1@l(r27)
    fmuls f13, f13, f0

    ; Convert and load corrected timing back
    fctiwz f13, f13
    lis r27, correctedTimingTemp@ha
    stfd f13, correctedTimingTemp@l(r27)
    lis r27, correctedTimingTempL@ha
    lwz r12, correctedTimingTempL@l(r27)
    
    blr

_justFrame2:
    lwz r0, 0x478(r29)
    cmpwi r0, 0
    beqlr

    ; Convert timing to floating point for multiplication
    xoris r0, r0, 0x8000
    lis r8, timingFloatConv@ha
    stw r0, timingFloatConv@l+0x4(r8)
    lis r0, 0x4330
    stw r0, timingFloatConv@l+0x0(r8)
    lfd f13, timingFloatConv@l+0x0(r8)
    lis r8, convSub@ha
    lfd f0, convSub@l(r8)
    fsub f13, f13, f0
    frsp f13, f13

    ; Multiply timing
    lis r8, averageFPS1@ha
    lfs f0, averageFPS1@l(r8)
    fmuls f13, f13, f0

    ; Convert corrected timing back
    fctiwz f13, f13
    lis r8, correctedTimingTemp@ha
    stfd f13, correctedTimingTemp@l(r8)
    lis r8, correctedTimingTempL@ha
    lwz r0, correctedTimingTempL@l(r8)

    blr


[XCX_FPS++_QTE_V101E] ; ########################################################
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
; menu::MenuButtonChallenge::setup
0x02ACE40C = lis r7, averageFPS30Inv@ha
0x02ACE414 = lfs f0, averageFPS30Inv@l(r7)
; menu::MenuButtonChallenge::move
0x02ACE6E4 = bla _justFrame1
0x02ACE700 = bla _justFrame2

[XCX_FPS++_QTE_V102U] ; ########################################################
moduleMatches = 0x30B6E091 ; 1.0.2U
; menu::MenuButtonChallenge::setup
0x02ACE3FC = lis r7, averageFPS30Inv@ha
0x02ACE404 = lfs f0, averageFPS30Inv@l(r7)
; menu::MenuButtonChallenge::move
0x02ACE6D4 = bla _justFrame1
0x02ACE6F0 = bla _justFrame2

[XCX_FPS++_QTE_V102J] ; ########################################################
moduleMatches = 0x7672271D ; 1.0.2J
; menu::MenuButtonChallenge::setup
0x02ACAA38 = lis r7, averageFPS30Inv@ha
0x02ACAA40 = lfs f0, averageFPS30Inv@l(r7)
; menu::MenuButtonChallenge::move
0x02ACAD10 = bla _justFrame1
0x02ACAD2C = bla _justFrame2

[XCX_FPS++_QTE_V100U] ; ########################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
; menu::MenuButtonChallenge::setup
0x02ACE380 = lis r7, averageFPS30Inv@ha
0x02ACE388 = lfs f0, averageFPS30Inv@l(r7)
; menu::MenuButtonChallenge::move
0x02ACE658 = bla _justFrame1
0x02ACE674 = bla _justFrame2

[XCX_FPS++_QTE_V100J] ; ########################################################
moduleMatches = 0x785CA8A9 ; 1.0.0J
; menu::MenuButtonChallenge::setup
0x02AC8C00 = lis r7, averageFPS30Inv@ha
0x02AC8C08 = lfs f0, averageFPS30Inv@l(r7)
; menu::MenuButtonChallenge::move
0x02AC8ED8 = bla _justFrame1
0x02AC8EF4 = bla _justFrame2
