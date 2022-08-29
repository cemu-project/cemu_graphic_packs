[XCX_FPS++_GameSpeed]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

# Constants

timerTickSpeed:
busSpeed:
.float 62156250

convSub:
.uint 0x43300000
.uint 0x80000000

floatConv:
floatConvHa:
.uint 0
floatConvL:
.uint 0

prevFrameTime:
prevFrameTime_Up32Bit:
.uint 0
prevFrameTime_Low32Bit:
.uint 0

const_0.0:
.float 0.0
const_0.1:
.float 0.1
const_0.25:
.float 0.25
const_0.5:
.float 0.5
const_1:
.float 1.0
const_1.5:
.float 1.5
const_2.0:
.float 2.0
const_15:
.float 15.0
const_30:
.float 30.0
const_60:
.float 60.0


# Variables

fpsLimit:
.float $fpsLimit

lowFPSLimit:
.float $lowFPSLimit

bufferSizeDivider:
.float $frameAverageAmount

averageFPS30:
.float $fpsLimit

averageFPS30Inv:
.float (900/$fpsLimit)

averageFPS1:
.float ($fpsLimit/30.0)

averageFPS1Inv:
.float (30.0/$fpsLimit)

averageFPS0.1:
.float ($fpsLimit/300.0)

const_guiSpeed:
.float $guiSpeed

buffer:
.float 30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30 ; buffer can only store a max length of 32 frames

bufferIndex:
.int 0

bufferIndexEnd:
.int (4*$frameAverageAmount)


; free registers: r10, r8, r9, r0
; backed-up registers: r3, r4
_calculateGamespeed:

; TODO: Maybe filter out 0
_loadPreviousTicks:
; Load current previous tick before overwriting it
lis r9, prevFrameTime_Up32Bit@ha
lwz r8, prevFrameTime_Up32Bit@l(r9)
lis r9, prevFrameTime_Low32Bit@ha
lwz r10, prevFrameTime_Low32Bit@l(r9)
_storeCurrentTicks:
; Store current ticks
lis r9, prevFrameTime_Up32Bit@ha
stw r3, prevFrameTime_Up32Bit@l(r9)
lis r9, prevFrameTime_Low32Bit@ha
stw r4, prevFrameTime_Low32Bit@l(r9)

_getGameTicks:
.uint 0x7D2A2010 ; subfc r9, r10, r4
.uint 0x7C081910 ; subfe r0, r8, r3

_convertTicksToFrametime:
xoris r9, r9, 0x8000
lis r10, floatConv@ha
stw r9, floatConv@l+0x4(r10)
lis r9, 0x4330
stw r9, floatConv@l+0x0(r10)
lfd f10, floatConv@l+0x0(r10)
lis r10, convSub@ha
lfd f12, convSub@l(r10)
fsub f10, f10, f12
frsp f10, f10

; Call externalized cutscene FPS function
_callWaitTillCutsceneLimit:
b _waitTillCutsceneLimit

_calculateFPS:
lis r10, const_1@ha
lfs f12, const_1@l(r10)
fdivs f10, f12, f10
lis r10, timerTickSpeed@ha
lfs f12, timerTickSpeed@l(r10)
fmuls f10, f12, f10

; Calculate the rolling average FPS over the last N amount of frames which are stored in the circular buffer
_calcAverageFPS:
; Store FPS value from this frame into the buffer first
lis r10, buffer@ha
addi r10, r10, buffer@l
lis r9, bufferIndex@ha
lwz r9, bufferIndex@l(r9)
.int 0x7D4A4D2E
;stfsx f10, r10, r9

; Then store the offset to the next buffer entry
lis r8, bufferIndexEnd@ha
lwz r8, bufferIndexEnd@l(r8)
addi r9, r9, 0x04
cmpw r8, r9
bgt .+0x08
li r9, 0
lis r10, bufferIndex@ha
stw r9, bufferIndex@l(r10)

; Finally, loop over the whole buffer and create an average sum of FPS values
_calculateBuffer:
lis r9, const_0.0@ha
lfs f10, const_0.0@l(r9)
lis r9, buffer@ha
addi r9, r9, buffer@l
lis r8, bufferIndexEnd@ha ; technically unncessary
lwz r8, bufferIndexEnd@l(r8)
li r10, 0

startCalculateBufferLoop:
.int 0x7D89542E
; lfsx f12, r9, r10
fadds f10, f10, f12
addi r10, r10, 0x04
cmpw r10, r8
blt startCalculateBufferLoop
lis r10, bufferSizeDivider@ha
lfs f7, bufferSizeDivider@l(r10)
fdivs f10, f10, f7

_setGameSpeed:
; Prevent the FPS from going below the lower FPS limit bounds.
lis r10, lowFPSLimit@ha
lfs f7, lowFPSLimit@l(r10)
fcmpu cr0, f10, f7
bgt .+0x08
fmr f10, f7

; Set game speed (30 range)
lis r10, averageFPS30@ha
stfs f10, averageFPS30@l(r10)

; Set game speed (inverted 30 range)
lis r10, const_30@ha
lfs f12, const_30@l(r10)
fmuls f12, f12, f12
fdivs f7, f12, f10
lis r10, averageFPS30Inv@ha
stfs f7, averageFPS30Inv@l(r10)

; Set game speed (1.0 range)
lis r10, const_30@ha
lfs f12, const_30@l(r10)
fdivs f7, f10, f12
lis r10, averageFPS1@ha
stfs f7, averageFPS1@l(r10)

; Set game speed (inverted 1.0 range)
fdivs f7, f12, f10
lis r10, averageFPS1Inv@ha
stfs f7, averageFPS1Inv@l(r10)

; Set game speed (inverted 0.1 range)
lis r10, averageFPS1@ha
lfs f7, averageFPS1@l(r10)
fdivs f7, f12, f10
lis r10, const_0.1@ha
lfs f12, const_0.1@l(r10)
fmuls f7, f12, f7
lis r10, averageFPS0.1@ha
stfs f7, averageFPS0.1@l(r10)

; Set title FPS manually instead of editing 10 places that read this
lis r10, averageFPS1Inv@ha
lfs f7, averageFPS1Inv@l(r10)
lis r10, titleScreenSpeed@ha
stfs f7, titleScreenSpeed@l(r10)

; Set soul voice FPS manually
lis r10, averageFPS30Inv@ha
lfs f7, averageFPS30Inv@l(r10)
lis r10, soulVoiceSpeed@ha
stfs f7, soulVoiceSpeed@l(r10)

; Set havok half-speed
lis r10, averageFPS30@ha
lfs f7, averageFPS30@l(r10)
lis r10, havokHalfSpeed@ha
stfs f7, havokHalfSpeed@l(r10)

; Reset the cutscene FPS limit each frame
_callResetCutsceneLimit:
b _resetCutsceneLimit

; Restore register state
_restoreRegisters:
lis r9, prevFrameTime_Up32Bit@ha
lwz r3, prevFrameTime_Up32Bit@l(r9)
lis r9, prevFrameTime_Low32Bit@ha
lwz r4, prevFrameTime_Low32Bit@l(r9)

lwz r10, 0x14(r1)
blr


[XCX_FPS++_GameSpeed_V101E] ; #####################################################################################################################################################
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E

; Global data patch
0x10171980 = havokHalfSpeed:
0x10171980 = .float $fpsLimit
0x100598E4 = titleScreenSpeed:
0x100598E4 = .float (30.0/$fpsLimit)
0x10012644 = soulVoiceSpeed:
0x10012644 = .float (900/$fpsLimit)

; Instruction-specific patches
0x02228274 = lis r5, averageFPS0.1@ha             ; Controller acceleration
0x0222827C = lfs f30, averageFPS0.1@l(r5)         ; Controller acceleration
0x0273E3CC = lis r7, averageFPS1Inv@ha            ; Sync elevator, vehicles etc
0x0273E3D0 = lfs f31, averageFPS1Inv@l(r7)        ; Sync elevator, vehicles etc
0x0276A85C = lis r8, averageFPS1Inv@ha            ; Sync in-game cutscenes
0x0276A860 = lfs f31, averageFPS1Inv@l(r8)        ; Sync in-game cutscenes
0x025F299C = lis r12, averageFPS1Inv@ha           ; Move__11CfSceneTaskFv ; Filter CPU, 30FPS logic
0x025F29A4 = lfs f31, averageFPS1Inv@l(r12)       ; Move__11CfSceneTaskFv
# 0x02D39D6C = lis r12, const_guiSpeed@ha           ; AnimeObject::set
# 0x02D39D70 = lfs f13, const_guiSpeed@l(r12)       ; AnimeObject::set
0x02D20328 = lis r12, const_guiSpeed@ha           ; MenuObject::playEvent
0x02D2032C = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEvent
0x02D203F4 = lis r12, const_guiSpeed@ha           ; MenuObject::playEventFrame
0x02D203F8 = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEventFrame

; Call GX2SetSwapInterval with 0 which removes any vsync
0x02FD8A94 = li r3, 0
; Use FPS waiting logic even with swap interval being 0
0x02FD5A14 = li r3, 1

0x02FD5AB4 = bla _calculateGamespeed
0x027685B0 = bla _useCutsceneLimit
0x03AC2810 = bla _usePrerenderedCutsceneLimit

# These patches are replaced by lowering the framerate to prevent side-effects
# 0x027398B4 = lis r11, averageFPS1@ha              ; Double updateEventParam cutscenes
# 0x027398C0 = lfs f1, averageFPS1@l(r11)           ; Double updateEventParam cutscenes
# 0x027A33D8 = lis r10, averageFPS1Inv@ha           ; Half SyncFrame cinematic cutscene, fixes timing issues with cinematic cutscenes
# 0x027A33DC = lfs f1, averageFPS1Inv@l(r10)        ; But introduces shake and stutter issue. CODE XREF: ev::CEvtManager::startPage((float,bool))+6Cj


[XCX_FPS++_GameSpeed_V102U] ; #####################################################################################################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

; Global data patch
0x10171980 = havokHalfSpeed:
0x10171980 = .float $fpsLimit
0x100598E4 = titleScreenSpeed:
0x100598E4 = .float (30.0/$fpsLimit)
0x10012644 = soulVoiceSpeed:
0x10012644 = .float (900/$fpsLimit)

; Instruction-specific patches
0x02228274 = lis r5, averageFPS0.1@ha             ; Controller acceleration
0x0222827C = lfs f30, averageFPS0.1@l(r5)         ; Controller acceleration
0x0273E3CC = lis r7, averageFPS1Inv@ha            ; Sync elevator, vehicles etc
0x0273E3D0 = lfs f31, averageFPS1Inv@l(r7)        ; Sync elevator, vehicles etc
0x0276A85C = lis r8, averageFPS1Inv@ha            ; Sync in-game cutscenes
0x0276A860 = lfs f31, averageFPS1Inv@l(r8)        ; Sync in-game cutscenes
0x025F299C = lis r12, averageFPS1Inv@ha           ; Move__11CfSceneTaskFv ; Filter CPU, 30FPS logic
0x025F29A4 = lfs f31, averageFPS1Inv@l(r12)       ; Move__11CfSceneTaskFv
# 0x02D39CE0 = lis r12, const_guiSpeed@ha           ; AnimeObject::set
# 0x02D39CE4 = lfs f13, const_guiSpeed@l(r12)       ; AnimeObject::set
0x02D202C8 = lis r12, const_guiSpeed@ha           ; MenuObject::playEvent
0x02D202CC = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEvent
0x02D20394 = lis r12, const_guiSpeed@ha           ; MenuObject::playEventFrame
0x02D20398 = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEventFrame

; Call GX2SetSwapInterval with 0 which removes any vsync
0x02FD8A34 = li r3, 0
; Use FPS waiting logic even with swap interval being 0
0x02FD59B4 = li r3, 1

0x02FD5A54 = bla _calculateGamespeed
0x027685B0 = bla _useCutsceneLimit
0x03AC2790 = bla _usePrerenderedCutsceneLimit

# These patches are replaced by lowering the framerate to prevent side-effects
# 0x027398B4 = lis r11, averageFPS1@ha              ; Double updateEventParam cutscenes
# 0x027398C0 = lfs f1, averageFPS1@l(r11)           ; Double updateEventParam cutscenes
# 0x027A33D8 = lis r10, averageFPS1Inv@ha           ; Half SyncFrame cinematic cutscene, fixes timing issues with cinematic cutscenes
# 0x027A33DC = lfs f1, averageFPS1Inv@l(r10)        ; But introduces shake and stutter issue. CODE XREF: ev::CEvtManager::startPage((float,bool))+6Cj


[XCX_FPS++_GameSpeed_V102J] ; #####################################################################################################################################################
moduleMatches = 0x7672271D ; 1.0.2J

; Global data patch
0x10171570 = havokHalfSpeed:
0x10171570 = .float $fpsLimit
0x1005989C = titleScreenSpeed:
0x1005989C = .float (30.0/$fpsLimit)
0x10012644 = soulVoiceSpeed:
0x10012644 = .float (900/$fpsLimit)

; Instruction-specific patches
0x02227D40 = lis r5, averageFPS0.1@ha             ; Controller acceleration
0x02227D48 = lfs f30, averageFPS0.1@l(r5)         ; Controller acceleration
0x0273CB44 = lis r7, averageFPS1Inv@ha            ; Sync elevator, vehicles etc
0x0273CB48 = lfs f31, averageFPS1Inv@l(r7)        ; Sync elevator, vehicles etc
0x02768FD4 = lis r8, averageFPS1Inv@ha            ; Sync in-game cutscenes
0x02768FD8 = lfs f31, averageFPS1Inv@l(r8)        ; Sync in-game cutscenes
0x025F1F78 = lis r12, averageFPS1Inv@ha           ; Move__11CfSceneTaskFv ; Filter CPU, 30FPS logic
0x025F1F80 = lfs f31, averageFPS1Inv@l(r12)       ; Move__11CfSceneTaskFv
# 0x02D35234 = lis r12, const_guiSpeed@ha           ; AnimeObject::set
# 0x02D35238 = lfs f13, const_guiSpeed@l(r12)       ; AnimeObject::set
0x02D1B818 = lis r12, const_guiSpeed@ha           ; MenuObject::playEvent
0x02D1B81C = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEvent
0x02D1B8E4 = lis r12, const_guiSpeed@ha           ; MenuObject::playEventFrame
0x02D1B8E8 = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEventFrame

; Call GX2SetSwapInterval with 0 which removes any vsync
0x02FD3F5C = li r3, 0
; Use FPS waiting logic even with swap interval being 0
0x02FD0EDC = li r3, 1

0x02FD0F7C = bla _calculateGamespeed
0x02766D28 = bla _useCutsceneLimit
0x03ABDBA8 = bla _usePrerenderedCutsceneLimit

# These patches are replaced by lowering the framerate to prevent side-effects
# 0x0273802C = lis r11, averageFPS1@ha              ; Double updateEventParam cutscenes
# 0x02738038 = lfs f1, averageFPS1@l(r11)           ; Double updateEventParam cutscenes
# 0x027A1120 = lis r10, averageFPS1Inv@ha           ; Half SyncFrame cinematic cutscene, fixes timing issues with cinematic cutscenes
# 0x027A1124 = lfs f1, averageFPS1Inv@l(r10)        ; But introduces shake and stutter issue. CODE XREF: ev::CEvtManager::startPage((float,bool))+6Cj


[XCX_FPS++_GameSpeed_V100U] ; #####################################################################################################################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U

; Global data patch
0x10171880 = havokHalfSpeed:
0x10171880 = .float $fpsLimit
0x100598E4 = titleScreenSpeed:
0x100598E4 = .float (30.0/$fpsLimit)
0x10012644 = soulVoiceSpeed:
0x10012644 = .float (900/$fpsLimit)

; Instruction-specific patches
0x02228274 = lis r5, averageFPS0.1@ha             ; Controller acceleration
0x0222827C = lfs f30, averageFPS0.1@l(r5)         ; Controller acceleration
0x0273E36C = lis r7, averageFPS1Inv@ha            ; Sync elevator, vehicles etc
0x0273E370 = lfs f31, averageFPS1Inv@l(r7)        ; Sync elevator, vehicles etc
0x0276A7FC = lis r8, averageFPS1Inv@ha            ; Sync in-game cutscenes
0x0276A800 = lfs f31, averageFPS1Inv@l(r8)        ; Sync in-game cutscenes
0x025F292C = lis r12, averageFPS1Inv@ha           ; Move__11CfSceneTaskFv ; Filter CPU, 30FPS logic
0x025F2934 = lfs f31, averageFPS1Inv@l(r12)       ; Move__11CfSceneTaskFv
# 0x02D39B68 = lis r12, const_guiSpeed@ha           ; AnimeObject::set
# 0x02D39B6C = lfs f13, const_guiSpeed@l(r12)       ; AnimeObject::set
0x02D20150 = lis r12, const_guiSpeed@ha           ; MenuObject::playEvent
0x02D20154 = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEvent
0x02D2021C = lis r12, const_guiSpeed@ha           ; MenuObject::playEventFrame
0x02D20220 = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEventFrame

; Call GX2SetSwapInterval with 0 which removes any vsync
0x02FD88BC = li r3, 0
; Use FPS waiting logic even with swap interval being 0
0x02FD583C = li r3, 1

0x02FD58DC = bla _calculateGamespeed
0x02768550 = bla _useCutsceneLimit
0x03AC2610 = bla _usePrerenderedCutsceneLimit

# These patches are replaced by lowering the framerate to prevent side-effects
# 0x02739854 = lis r11, averageFPS1@ha              ; Double updateEventParam cutscenes
# 0x02739860 = lfs f1, averageFPS1@l(r11)           ; Double updateEventParam cutscenes
# 0x027A3378 = lis r10, averageFPS1Inv@ha           ; Half SyncFrame cinematic cutscene, fixes timing issues with cinematic cutscenes
# 0x027A337C = lfs f1, averageFPS1Inv@l(r10)        ; But introduces shake and stutter issue. CODE XREF: ev::CEvtManager::startPage((float,bool))+6Cj


[XCX_FPS++_GameSpeed_V100J] ; #####################################################################################################################################################
moduleMatches = 0x785CA8A9 ; 1.0.0J

; Global data patch
0x10171070 = havokHalfSpeed:
0x10171070 = .float $fpsLimit
0x10059514 = titleScreenSpeed:
0x10059514 = .float (30.0/$fpsLimit)
0x1001260C = soulVoiceSpeed:
0x1001260C = .float (900/$fpsLimit)

; Instruction-specific patches
0x02227ABC = lis r5, averageFPS0.1@ha             ; Controller acceleration
0x02227AC4 = lfs f30, averageFPS0.1@l(r5)         ; Controller acceleration
0x0273BBD0 = lis r7, averageFPS1Inv@ha            ; Sync elevator, vehicles etc
0x0273BBD4 = lfs f31, averageFPS1Inv@l(r7)        ; Sync elevator, vehicles etc
0x02768064 = lis r8, averageFPS1Inv@ha            ; Sync in-game cutscenes
0x02768068 = lfs f31, averageFPS1Inv@l(r8)        ; Sync in-game cutscenes
0x025F149C = lis r12, averageFPS1Inv@ha           ; Move__11CfSceneTaskFv ; Filter CPU, 30FPS logic
0x025F14A4 = lfs f31, averageFPS1Inv@l(r12)       ; Move__11CfSceneTaskFv
# 0x02D30A10 = lis r12, const_guiSpeed@ha           ; AnimeObject::set
# 0x02D30A14 = lfs f13, const_guiSpeed@l(r12)       ; AnimeObject::set
0x02D1709C = lis r12, const_guiSpeed@ha           ; MenuObject::playEvent
0x02D170A0 = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEvent
0x02D17168 = lis r12, const_guiSpeed@ha           ; MenuObject::playEventFrame
0x02D1716C = lfs f31, const_guiSpeed@l(r12)       ; MenuObject::playEventFrame

; Call GX2SetSwapInterval with 0 which removes any vsync
0x02FCEB9C = li r3, 0
; Use FPS waiting logic even with swap interval being 0
0x02FCBB1C = li r3, 1

0x02FCBBBC = bla _calculateGamespeed
0x02765DB8 = bla _useCutsceneLimit
0x03AB85A8 = bla _usePrerenderedCutsceneLimit

# These patches are replaced by lowering the framerate to prevent side-effects
# 0x027370B8 = lis r11, averageFPS1@ha              ; Double updateEventParam cutscenes
# 0x027370C4 = lfs f1, averageFPS1@l(r11)           ; Double updateEventParam cutscenes
# 0x027A0180 = lis r10, averageFPS1Inv@ha           ; Half SyncFrame cinematic cutscene, fixes timing issues with cinematic cutscenes
# 0x027A0184 = lfs f1, averageFPS1Inv@l(r10)        ; But introduces shake and stutter issue. CODE XREF: ev::CEvtManager::startPage((float,bool))+6Cj
