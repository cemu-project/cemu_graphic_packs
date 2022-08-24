[ControllerAPI]
moduleMatches = 0x6267bfd0
.origin = codecave

; Initialize register storage variables
storeLR:
.int 0
storeR0:
.int 0
storeR1:
.int 0
storeR2:
.int 0
storeR3:
.int 0

0x2d5b82c = bla ControllerAPI

ControllerAPI:
; Store the state of a bunch of registers to codecave variables.
; They're restored afterwards, ensuring the game doesn't
; crash when returning to vanilla code.
mflr r5
lis r4, storeLR@ha
stw r5, storeLR@l(r4)
lis r4, storeR0@ha
stw r0, storeR0@l(r4)
lis r4, storeR1@ha
stw r1, storeR1@l(r4)
lis r4, storeR2@ha
stw r2, storeR2@l(r4)
lis r4, storeR3@ha
stw r3, storeR3@l(r4)

; Set function parameters
li r10, 1
addi r3, r1, 8
stw r10, 8 (r1)

; Branch to MaskController::getControllerSafe()
lis r4, 0x02DE
ori r4, r4, 0x207C
mtctr r4
bctrl

; Restore registers from storage
lis r4, storeLR@ha
lwz r5, storeLR@l(r4)
mtlr r5
lis r4, storeR0@ha
lwz r0, storeR0@l(r4)
lis r4, storeR1@ha
lwz r1, storeR1@l(r4)
lis r4, storeR2@ha
lwz r2, storeR2@l(r4)
lis r4, storeR3@ha
lwz r3, storeR3@l(r4)
lis r4, 0
lis r5, 0
mr r30, r3 ; Vanilla instruction
blr
