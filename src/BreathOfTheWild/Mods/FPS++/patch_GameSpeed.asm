[BotW_Gamespeed_V208]
moduleMatches = 0x6267BFD0

.origin = codecave


# Constants

const_0.5:
.float 30
const_1:
.float 1
const_30:
.float 30

busSpeed:
.float 62156250

convSub:
.uint 0x43300000
.uint 0x80000000


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
.float $fpsLimit

averageFPS1:
.float 30/$fpsLimit

averageFPS1Inv:
.float $fpsLimit/30

averageSum:
.float $fpsLimit*$frameAverageAmount

bufferStart:
.ptr 0xDC

bufferCurrEntry:
.ptr 0xDC

bufferEnd:
.ptr 0xDC+(4*$frameAverageAmount)

; Useful for trying potential FPS values. Need to set debugMode = 1 to enable the debugging in the interface and code.
debugAddr:
.ptr 0x1040CE78

debugMultiplier:
.float $debugMultiplier


# Code

_calculateGamespeed:
stw	r0,	0x78(r30)				; Execute original instruction that got replaced with a jump to this function

; If static FPS is enabled, always set currently "running" FPS to $fpsLimit
li r3, $staticFPSMode			; Load the $staticFPSMode setting into r3
cmpwi r3, 1						; Compare with 1, which is when it's enabled
bne _calculateDynamicFPS		; If the comparison is not equal, run
lis r3, fpsLimit@ha				; Load current FPS limit...
lfs f10, fpsLimit@l(r3)			; ...into f10
b _setGamespeed					; Skip dynamic FPS code when static mode is enabled and go to the game speed setting code

; Calculate speed of current frame (FPS). It's calculated by using the ticks between the previous frame and now, which is stored in r12, and the amount of ticks that the Wii U executes in a second (the bus speed).
_calculateDynamicFPS:
xoris r12, r12, 0x8000			; Flip the sign bit of int ticks for floating point conversion
stw r12, 0xD4(r30)				; Store sign flipped ticks in memory as lower half of double
lis r12, 0x4330					; Create upper half of ticks double
stw r12, 0xD0(r30)				; Store it in upper half of memory
lfd f10, 0xD0(r30)				; Load full double ticks into f10
lis r12, convSub@ha				; Load number to subtract from tick double...
lfd f12, convSub@l(r12)			; ...to create tick float into f12
fsub f10, f10, f12				; Do the subtraction
frsp f10, f10					; Round to single precision and tick float is in f10
lis r12, const_1@ha				; Load float of 1...
lfs f12, const_1@l(r12)			; ...into f12
fdivs f10, f12, f10				; Divide 1 by ticks
lis r12, busSpeed@ha			; Load wii u bus speed...
lfs f12, busSpeed@l(r12)		; ...into f12
fmuls f10, f12, f10				; Multiply bus speed to have current fps in f10. (1/ticks)*bus speed

; Initialize the circular buffer with default values
_initializeAverageBuffer:
lwz r11, 0xD8(r30)				; Check whether/what the current buffer settings are
cmpwi r11, $frameAverageAmount	; Compare the previously $frameAverageAmount with the current $frameAverageAmount
beq _calcAverageFPS				; Continue to calulating the average FPS if the previous settings are the same as the permanently set settings
lis r12, fpsLimit@ha			; Load current FPS limit...
lfs f10, fpsLimit@l(r12)		; ...into f12
lis r12, bufferStart@ha			; Load offset to the start of the averaging buffer...
lwz r12, bufferStart@l(r12)		; ...into r12
lis r3, bufferEnd@ha			; Load offset to the end of the averaging buffer...
lwz r3, bufferEnd@l(r3)			; ...into r3
add r11, r12, r30				; Make full offset by adding r30 (the empty buffer offset) to r12, which is the buffer offset.
stfs f10, 0x0(r11)				; Store f12 to the address in r12 + 0x04 using this specific instruction, which also adds the 0x04 to r12
addi r12, r12, 0x04				; Add 0x04 to the buffer offset to make the next entry offset
cmpw r12, r3					; Compare the current address offset in r12 with the address offset in r3
ble .-0x10						; Loop back until the whole buffer is initialized with the value from f12
li r11, $frameAverageAmount		; Load current $frameAverageAmount again...
stw r11, 0xD8(r30)				; ...to store that value again in the permanent (doesn't change after reloading) memory

; Calculate the rolling average FPS over the last N amount of frames which are stored in the circular buffer
_calcAverageFPS:
lis r3, bufferCurrEntry@ha		; Load the offset to the current value
lwz r12, bufferCurrEntry@l(r3)	; Load the current buffer offset
lis r11, averageSum@ha			; Load the current average sum
lfs f7, averageSum@l(r11)		; ...into f7

add r3, r12, r30				; Add r12 to r30 to create the whole offset, since Cemu's assembly doesn't support LFSX and STFX
lfs f12, 0x0(r3)				; Load the value that's stored in the current offset
fadds f7, f7, f10				; Add the FPS from this current frame
fsubs f7, f7, f12				; Subtract this value from the current average sum
stfs f7, averageSum@l(r11)		; Store this new average sum again
stfs f10, 0x0(r3)				; Store the FPS value from this current frame in place of the old value

; Store the offset to the next buffer entry
lis r11, bufferEnd@ha			; Load offset to the end of the averaging buffer
lwz r11, bufferEnd@l(r11)		; ...into r11
addi r12, r12, 0x04				; Add 0x04 to the current entry offset to have the next entry offset
cmpw r11, r12 					; Compare this new entry offset to the end offset
bge .+0x0C						; Skip the next 2 lines if the next entry offset is smaller
lis r12, bufferStart@ha			; Load start of the buffer offset...
lwz r12, bufferStart@l(r12)		; ...into r12
lis r3, bufferCurrEntry@ha		; Load current buffer entry
stw r12, bufferCurrEntry@l(r3)	; ...into r12

lis r3, bufferSizeDivider@ha	; Load the buffer size divider
lfs f10, bufferSizeDivider@l(r3); ...into f10
fdivs f10, f7, f10				; Divide the average FPS sum by the buffer size divider to get the average FPS

; Calculates the gamespeed (which is stored in f10 regardless of average or static code path)
_setGamespeed:
; Prevent the FPS from going below 30FPS.
lis r11, lowFPSLimit@ha			; Load the lowest FPS that the game speed may be set to...
lfs f12, lowFPSLimit@l(r11)		; ...into f12
fcmpu cr0, f10, f12				; Compare the calculated FPS with the lowest FPS limit
bgt .+0x08						; Skip the next line when the calculated FPS is higher then the low limit
fmr f10, f12					; ...if this line isn't skipped, set the FPS to that low limit

; Set average speed (30 range)
lis r11, averageFPS30@ha		; Store the calculated FPS...
stfs f10, averageFPS30@l(r11)	; ...to replace constants that normally use 30

; Set average speed (1.0 range)
lis r11, const_30@ha			; Load a constant float with 30...
lfs f12, const_30@l(r11)		; ...into f12
fdivs f7, f12, f10				; Divide the calculated FPS by 30
lis r11, averageFPS1@ha			; Store this new divided calculated FPS...
stfs f7, averageFPS1@l(r11)		; ...to replace constants that normally use 1

; Set average speed (inverted 1.0 range)
fdivs f10, f10, f12				; Multiply 1.0 by 30.0 to invert the FPS
lis r11, averageFPS1Inv@ha		; Store the inverted 30 float...
stfs f10, averageFPS1Inv@l(r11)	; ...to replace constants that is lower when FPS is higher

; Set average speed (inverted 30 range)
fmuls f10, f7, f12				; Multiply 1.0 by 30.0 to invert the FPS
lis r11, averageFPS30Inv@ha		; Store the inverted 30 float...
stfs f10, averageFPS30Inv@l(r11); ...to replace constants that is lower when FPS is higher

; Check whether debug mode is on
li r11, $debugMode				; Load debugMode value in r11 
cmpwi r11, 1					; Compare the value with 1
bnelr							; If it's not equal, return back to the link register. Otherwise, run the following lines too...

lis r11, debugMultiplier@ha		; Load the debug multiplier...
lfs f12, debugMultiplier@l(r11)	; ...which is used to modify the calulated FPS to experiment with potential FPS values
fmuls f7, f7, f12				; Multiply the current FPS with this debug multiplier
lis r11, debugAddr@ha			; Load the pointer to the debug value address...
lwz r11, debugAddr@l(r11)		; ...into r11
stfs f7, 0x0(r11)				; Store the multiplied value in the address from the pointer
blr								; Return back to the address stored in the link register

; Multiplies the time draining using the calculated FPS
_changeArrowTimeDrain:
lfs f1, 0xFC(r11)				; Execute original instruction that got replaced with this codecave jump
lis r12, averageFPS1@ha			; Load the average FPS...
lfs f0, averageFPS1@l(r12)		; ...into f0
fmuls f1, f1, f0				; Multiply the time draining value by the average FPS divider
blr								; Return to the address that's stored in the link register

; Multiplies the distance you travel during the flurry rush dash using the calculated FPS
_changeFlurryRush:
lis r4, averageFPS1Inv@ha		; Load average FPS into f8..
lfs f8, averageFPS1Inv@l(r4)	; ...which is a float register that's safe to use since it's initialized later
fmuls f13, f13, f8				; Multiply the flurry rush distance (stored in f1) with the FPS multiplier
fcmpu cr0, f13, f29				; Execute original instruction that got replaced with this codecave jump
blr								; Return to the address that's stored in the link register

# Patches

0x1031E2C0 = .float 2
0x031FACD0 = nop							; Disable vsync
0x031FACF4 = nop							; Disable vsync loop

0x031FA97C = bla _calculateGamespeed		; Replace an instruction that gets called every frame to calculate the FPS

0x100775AC = .float -999.0					; Disable something that makes thunderblight ganon yeet off

0x02C6B8F8 = bla _changeFlurryRush			; Fix the flurry rush distance
0x02D5F760 = bla _changeArrowTimeDrain		; Fix the stamina drain during arrow time
0x03793328 = nop
0x03793334 = nop
0x03793378 = lis r29, averageFPS1@ha		; Load the calculated FPS value
0x03793380 = lfs f0, averageFPS1@l(r29)		; ...to use that as animation speed
0x0379338C = nop							; Prevent an instruction from overwriting the loaded value
0x03415C1C = lis r12, averageFPS1@ha		; Load the calculated FPS value
0x03415C24 = lfs f0, averageFPS1@l(r12)		; ...to store that for the GUI speed value
0x03415C2C = nop							; Prevent an instruction from overwriting the loaded value
0x02D90D2C = lis r10, averageFPS30@ha
0x02D90D30 = lfs f11, averageFPS30@l(r10)
0x02D90D88 = lis r10, averageFPS30@ha
0x02D90D8C = lfs f11, averageFPS30@l(r10)
0x037DC35C = lis r12, averageFPS1@ha		; Fix audio looping by loading the calculated FPS value...
0x037DC360 = lfs f13, averageFPS1@l(r12)	; ...instead of the normal static 1.0 float it uses
0x02F62B3C = lis r12, averageFPS1@ha		; Fix map scrolling by loading the calculated FPS value...
0x02F62B40 = lfs f0, averageFPS1@l(r12)		; ...instead of the normal static 1.0 float it uses
0x020E730C = lis r12, averageFPS30Inv@ha	; Fix arrow speed by loading the calculated FPS value...
0x020E731C = lfs f13, averageFPS30Inv@l(r12); ...instead of the normal static 30.0 float it uses
0x033609D8 = lis r6, averageFPS1@ha			; Fix shield surfing by loading the calculated FPS value...
0x033609E0 = lfs f0, averageFPS1@l(r6)		; ...instead of the normal static 1.0 float it uses