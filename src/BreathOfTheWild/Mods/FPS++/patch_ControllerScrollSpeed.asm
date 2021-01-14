[BotW_ControllerScrollSpeed_V208]
moduleMatches = 0x6267BFD0

.origin = codecave


const_roundUpModifier:
.float $roundUpModifier

averageFPS1IntInvIgnore:
.int 0
averageFPS1IntInvValue:
.int 1

disableFastScrolling:
.int 0

; The game initializes two tables for intial and repeated delay. One entry for each button (up to 32). Counts in frames.
; This is a very imperfect fix, which is why it's an opt-in fix that's even then only enabled for those that are above 60FPS in the menus.

; This calculates dynamic FPS system.
_calculateAverageFPSInt:
lis r8, averageFPS1@ha
lfs f0, averageFPS1@l(r8)
lis r8, const_roundUpModifier@ha
lfs f13, const_roundUpModifier@l(r8)
fadds f0, f0, f13
fctiwz f0, f0
lis r8, averageFPS1IntInvIgnore@ha
stfd f0, averageFPS1IntInvIgnore@l(r8)
li r8, 0
lis r10, disableFastScrolling@ha
stw r8, disableFastScrolling@l(r10)
lis r8, averageFPS1IntInvValue@ha
lwz r10, averageFPS1IntInvValue@l(r8)
cmpwi r10, $cursorFixAbove
ble disabledFix

lis r8, averageFPS1IntInvValue@ha
stw r10, averageFPS1IntInvValue@l(r8)
li r8, 1
lis r10, disableFastScrolling@ha
stw r8, disableFastScrolling@l(r10)
add r8, r29, r6
blr

disabledFix:
li r8, 1
lis r10, averageFPS1IntInvValue@ha
stw r8, averageFPS1IntInvValue@l(r10)
add r8, r29, r6
blr

_scaleRepeatInputDelay:
lis r7, averageFPS1IntInvValue@ha
lwz r7, averageFPS1IntInvValue@l(r7)
lbz r10, 0xC8(r8)						; read repeat delay (in frames) from table
mullw r10, r10, r7
blr

_scaleInitialInputDelay:
lis r7, averageFPS1IntInvValue@ha
lwz r7, averageFPS1IntInvValue@l(r7)
lbz r8, 0xA8(r4)						; read initial delay (in frames) from table
mullw r8, r8, r7
lwzx r7, r9, r11
blr

; Patch sead::ControllerBase::updateDerivativeParams_
0x030BD76C = bla _calculateAverageFPSInt
0x030bd770 = bla _scaleRepeatInputDelay
0x030BD77C = nop
0x030bd784 = bla _scaleInitialInputDelay


; Disable fast scrolling function
_disableFastScrolling:
lis r12, disableFastScrolling@ha
lwz r10, disableFastScrolling@l(r12)
cmpwi r10, 1
beq disableFastScrollingPath

lis r12, 4
addi r12, r12, 0x68C
cmpwi r6, 0
add r12, r3, r12
blr

disableFastScrollingPath:
mtlr r9
blr

0x03053AF8 = mflr r9
0x03053AFC = bla _disableFastScrolling
0x03053B00 = mtlr r9
0x03053B04 = nop
