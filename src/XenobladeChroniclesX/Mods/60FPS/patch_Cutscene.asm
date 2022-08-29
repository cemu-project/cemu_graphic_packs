[XCX_FPS++_Cutscene]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

forceCutsceneLimit:
.int 0

_useCutsceneLimit:
li r10, 5
lis r9, forceCutsceneLimit@ha
stw r10, forceCutsceneLimit@l(r9)

lfs f11, -0x303C(r8)
blr

_usePrerenderedCutsceneLimit:
li r4, 5
lis r3, forceCutsceneLimit@ha
stw r4, forceCutsceneLimit@l(r3)

lwz r3, 0x0(r30)
blr

_resetCutsceneLimit:
lis r9, forceCutsceneLimit@ha
lwz r10, forceCutsceneLimit@l(r9)
cmpwi r10, 0
ble _restoreRegisters

li r9, -1
add r10, r10, r9
lis r9, forceCutsceneLimit@ha
stw r10, forceCutsceneLimit@l(r9)
b _restoreRegisters

cutsceneFloatConv:
cutsceneFloatConvHa:
.uint 0
cutsceneFloatConvL:
.uint 0


; Check if a cutscene is ongoing with a set FPS limit
_waitTillCutsceneLimit:
li r10, $cutsceneFPSLimit
cmpwi r10, 1
bne _calculateFPS
lis r10, forceCutsceneLimit@ha
lwz r10, forceCutsceneLimit@l(r10)
cmpwi r10, 0
ble _calculateFPS

; If a cutscene FPS limit is set, lower FPS
_lowerCutsceneFPS:
lis r10, const_30@ha
lfs f12, const_30@l(r10)

; Calculate how many ticks a frame has to take to render at the given FPS limit
lis r10, const_1@ha
lfs f7, const_1@l(r10)
fdivs f12, f7, f12
lis r10, timerTickSpeed@ha
lfs f7, timerTickSpeed@l(r10)
fmuls f12, f7, f12

; Subtract the time that it took for the actual frame to render and make sure that it's not negative (which means a frame already took longer to render then the FPS limit)
fsubs f12, f12, f10
lis r10, const_0.0@ha
lfs f7, const_0.0@l(r10)
fcmpu cr0, f7, f12
ble .+0x8
fmr f12, f7

; Convert the remaining ticks that should be spend idling to an integer (but it requires storing it in memory)
fctiwz f12, f12
lis r10, cutsceneFloatConvHa@ha
stfd f12, cutsceneFloatConvHa@l(r10)

# ; Load the converted integer ticks and sleep for the given amount of time
mr r10, r4
lis r9, cutsceneFloatConvL@ha
lwz r4, cutsceneFloatConvL@l(r9)
mr r11, r3
# li r3, 0
lis r9, cutsceneFloatConvHa@ha
lwz r3, cutsceneFloatConvHa@l(r9)
mflr r9
bl import.coreinit.OSSleepTicks
mtlr r9
mr r3, r11
mr r4, r10

_reacquireTime:
mr r11, r3
mr r10, r4
mflr r9
bl import.coreinit.OSGetSystemTime
mtlr r9

lis r9, prevFrameTime_Up32Bit@ha
stw r3, prevFrameTime_Up32Bit@l(r9)
lis r9, prevFrameTime_Low32Bit@ha
stw r4, prevFrameTime_Low32Bit@l(r9)
mr r3, r11
mr r4, r10

; Directly set the game speed to 30FPS when cutscenes are active
lis r10, const_30@ha
lfs f10, const_30@l(r10)

b _setGameSpeed
