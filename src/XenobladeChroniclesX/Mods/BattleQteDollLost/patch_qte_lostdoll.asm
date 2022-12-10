[XCX_QTE_DOLLLOST]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.0U, 1.0.0J
.origin = codecave

_setDestructionExcellent:
    ; QTE result is Excellent, so we just cancel the Skell destruction,
    ; whatever the state of the insurance
    lwz r4, 0(r3)
    li r3, 0
    stb r3, 0x171(r4)   ; 0 = Skell not destroyed
    blr

_setDestructionGood:
    ; QTE result is Good, we cancel the Skell destruction IF insurance has not expired
    mflr r0             ; get LR pointer
    stwu r1, -0x10(r1)  ; create more space in the stack
    stw r31, 0xC(r1)    ; save r31 in the stack
    stw r30, 0x8(r1)    ; save r30 in the stack
    stw r0, 0x14(r1)    ; save LR pointer
    mr r3, r30
    bl getPropAccessor
    cmpwi r3, 0
    beq _setDestructionGoodExit
    lwz r4, 0(r3)
    lbz r3, 0x171(r4)   ; 0 = Skell not destroyed, 1 = insurance policy valid, 2 = insurance policy expired
    cmpwi r3, 2
    beq _skipCancel     ; insurance policy has expired, let the Skell being destroyed
    li r3, 0
    stb r3, 0x171(r4)   ; skell has insurance policy, cancel destruction
_skipCancel:
    lhz r3, 0x16E(r4)
    bl SetInsure        ; apply the new Skell status
_setDestructionGoodExit:
    lwz r0, 0x14(r1)    ; restore old value for LR pointer from stack
    lwz r30, 0x8(r1)    ; restore r30 from stack
    lwz r31, 0xC(r1)    ; restore r31 from stack
    mtlr r0             ; restore LR pointer
    addi r1, r1, 0x10   ; delete extra space in the stack
    mr r3, r31          ; restore r3 from r31 saved in the stack
    blr


[XCX_QTE_DOLLLOST_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x027F9464 = SetInsure:
0x023EEFB0 = getPropAccessor:
; ----------------------------------------------------------------------------
; WHO  : Battle::CSoulVoiceButtonChallenge::applyResult((void))
; WHAT : Cancel Skell destruction if insurance is still valid (or if QTE result is Excellent)
0x0209879C = bla _setDestructionExcellent
0x02098804 = bla _setDestructionGood

[XCX_QTE_DOLLLOST_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027F7008 = SetInsure:
0x023EE5F0 = getPropAccessor:
0x02098268 = bla _setDestructionExcellent
0x020982D0 = bla _setDestructionGood

[XCX_QTE_DOLLLOST_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027F93E8 = SetInsure:
0x023EEF40 = getPropAccessor:
0x0209879C = bla _setDestructionExcellent
0x02098804 = bla _setDestructionGood

[XCX_QTE_DOLLLOST_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027F5FDC = SetInsure:
0x023EE120 = getPropAccessor:
0x02097FF4 = bla _setDestructionExcellent
0x0209805C = bla _setDestructionGood
