[dpad-jump_v288]
moduleMatches = 0x659C782E

Lp_Utl_getCurSceneId = 0x028C67EC

.origin = codecave
state:
    .char 0
screen_x:
    .short 1080 ; LEFT
    .short 1080 ; UP
    .short 1080 ; RIGHT
    .short 1170 ; DOWN
screen_y:
    .short 130 ; LEFT
    .short 290 ; UP
    .short 450 ; RIGHT
    .short 625 ; DOWN

perform:
    mflr r0 ; Push LR and important registers to the stack
    stwu r1, -0x10(r1)
    stw r31, 0xC(r1)
    stw r30, 0x8(r1)
    stw r29, 0x4(r1)
    stw r0, 0x14(r1)

    mr r31, r4

    lis r30, state@hi
    ori r30, r30, state@l
    lbz r30, 0x0(r30)

    bl import.vpad.VPADGetTPCalibratedPoint
    mr r29, r3

    bl Lp_Utl_getCurSceneId ; Check if this is being called during a match
    cmpwi r3, 7
    beq perform_touch
    cmpwi r3, 12 ; Or Recon
    bne perform_exit ; If not, then exit

perform_touch:
    cmpwi r30, 0
    beq perform_exit ; Exit if state is 0 (no DPAD pressed)
    subi r30, r30, 1 ; state should be the array index + 1 (since 0 is reserved for no DPAD pressed)
    mulli r30, r30, 2 ; Multiply by 2 for the screen arrays (.short)

    lis r3, screen_x@hi
    ori r3, r3, screen_x@l
    lhzx r3, r3, r30

    lis r4, screen_y@hi
    ori r4, r4, screen_y@l
    lhzx r4, r4, r30

    ; Perform a fake touch on the gamepad
    sth r3, 0x0(r31) ; VPADTouchData.x
    sth r4, 0x2(r31) ; VPADTouchData.y

    li r3, 1
    li r4, 0
    sth r3, 0x4(r31) ; VPADTouchData.touched
    sth r4, 0x6(r31) ; VPADTouchData.validity

perform_exit:
    mr r3, r29 ; Return result from VPADGetTPCalibratedPoint
    lwz r0, 0x14(r1) ; Restore registers from stack
    mtlr r0
    lwz r31, 0xC(r1)
    lwz r30, 0x8(r1)
    lwz r29, 0x4(r1)
    addi r1, r1, 0x10
    blr

check_input:
    mflr r0 ; Push LR and important registers to the stack
    stwu r1, -0x10(r1)
    stw r31, 0xC(r1)
    stw r30, 0x8(r1)
    stw r0, 0x14(r1)

    mr r31, r4

    bl import.vpad.VPADRead
    mr r30, r3

    lwz r3, 0x0(r31) ; VPADStatus.hold
    lis r4, 0x0000
    ori r4, r4, 0x8000 ; VPAD_BUTTON_A
    li r5, 0 ; Set to 0 to avoid removing input (happens at set_state)
    and r6, r3, r4
    cmpw r6, r4
    bne check_input_reset

    li r4, 0x0800 ; VPAD_BUTTON_LEFT
    and r5, r3, r4
    cmpwi r5, 0
    li r4, 1
    bne check_input_set_state

    li r4, 0x0200 ; VPAD_BUTTON_UP
    and r5, r3, r4
    cmpwi r5, 0
    li r4, 2
    bne check_input_set_state

    li r4, 0x0400 ; VPAD_BUTTON_RIGHT
    and r5, r3, r4
    cmpwi r5, 0
    li r4, 3
    bne check_input_set_state

    li r4, 0x0100 ; VPAD_BUTTON_DOWN
    and r5, r3, r4
    cmpwi r5, 0
    beq check_input_reset
    li r4, 4

check_input_set_state:
    bl Lp_Utl_getCurSceneId ; Check if this is being called during a match
    cmpwi r3, 7
    beq _check_input_set_state
    cmpwi r3, 12 ; Or Recon
    bne check_input_exit ; If not, then exit

_check_input_set_state:
    lwz r3, 0x0(r31)
    sub r5, r3, r5 ; Disable DPAD input to avoid sending unnecessary signals (very hacky, doesn't work too well)
    stw r5, 0x0(r31)

    lis r3, state@hi
    ori r3, r3, state@l
    stb r4, 0x0(r3)

check_input_exit:
    mr r3, r30 ; Return result from VPADRead
    lwz r0, 0x14(r1) ; Restore registers from stack
    mtlr r0
    lwz r31, 0xC(r1)
    lwz r30, 0x8(r1)
    addi r1, r1, 0x10
    blr

check_input_reset:
    li r4, 0
    b check_input_set_state

0x28D0F30 = bl check_input ; VPADRead
0x286FD38 = bl perform ; VPADGetTPCalibratedPoint

