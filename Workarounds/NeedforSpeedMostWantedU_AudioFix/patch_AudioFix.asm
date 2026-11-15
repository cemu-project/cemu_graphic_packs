[NFSMWU_AudioFix_EU_v32]
moduleMatches = 0xfc370b5b
.origin = codecave

; ---------------------------------------------------------------------------------------------
; Need for Speed Most Wanted U - Audio Fix (EU, update v32)
;
; The game mixes its sound in software. Sound effects stored as DSP ADPCM streams are unpacked by
; two copies of the same routine (0x02C69714 and 0x031B65CC), which call the system function
; AXDecodeAdpcmData(data, info, samples, output) from snd_core for blocks of up to 512 samples at
; 32 kHz. Cemu 2.6 does not implement this function, the call returns without writing anything,
; and the game mixes whatever is left in its buffer on the stack. The same garbage block is then
; repeated every 8 ms, which is heard as a buzzing or hissing noise during gear shifts and braking.
;
; This patch supplies the decoder. Before each call the game itself writes the current nibble
; address (info+24) and the predictor/scale byte (info+62), and after the call it takes the
; history yn1/yn2 (info+64, info+66) from the last two decoded samples. The decoder therefore
; only reads the info structure and writes the output.
;
; Statistics at the start of the code cave (big endian), marker "TR2ADPCM":
; +8 calls, +12 decoded samples, +16 sample count of the last call, +20 nibble address of the last call
; ---------------------------------------------------------------------------------------------

statMarker:
.uint 0x54523241
.uint 0x4450434D
statCalls:
.uint 0
statSamples:
.uint 0
statLastCount:
.uint 0
statLastAddr:
.uint 0

_axDecodeAdpcmData:      ; r3 = ADPCM data, r4 = DSPADPCM info, r5 = number of samples, r6 = output (16 bit)
lis r12, statCalls@ha
lwz r11, statCalls@l(r12)
addi r11, r11, 1
stw r11, statCalls@l(r12)
lis r12, statLastCount@ha
stw r5, statLastCount@l(r12)
cmpwi r5, 0
ble _axDecDone
cmpwi r5, 4096
bgt _axDecDone
lis r12, statSamples@ha
lwz r11, statSamples@l(r12)
add r11, r11, r5
stw r11, statSamples@l(r12)
lwz r7, 24(r4)           ; current nibble address
lis r12, statLastAddr@ha
stw r7, statLastAddr@l(r12)
.uint 0xA104003E         ; lhz r8, 62(r4)    predictor (high nibble) and scale (low nibble)
.uint 0xA9240040         ; lha r9, 64(r4)    yn1
.uint 0xA9440042         ; lha r10, 66(r4)   yn2
_axDecLoop:
.uint 0x54E0073E         ; rlwinm r0, r7, 0, 28, 31    nibble address within the frame
cmpwi r0, 0
bne _axDecData
.uint 0x54ECF87E         ; rlwinm r12, r7, 31, 1, 31   byte offset
.uint 0x7D0360AE         ; lbzx r8, r3, r12            frame header: new predictor and scale
addi r7, r7, 2
_axDecData:
.uint 0x54ECF87E         ; rlwinm r12, r7, 31, 1, 31   byte offset
.uint 0x7D6360AE         ; lbzx r11, r3, r12
.uint 0x54E007FE         ; rlwinm r0, r7, 0, 31, 31    odd address = low nibble
cmpwi r0, 0
bne _axDecLow
.uint 0x556BE13E         ; rlwinm r11, r11, 28, 4, 31  high nibble
_axDecLow:
.uint 0x556B073E         ; rlwinm r11, r11, 0, 28, 31
cmpwi r11, 8
blt _axDecScale
addi r11, r11, -16       ; sign of the 4 bit value
_axDecScale:
.uint 0x5500073E         ; rlwinm r0, r8, 0, 28, 31    scale exponent
.uint 0x7D6B0030         ; slw r11, r11, r0
.uint 0x556B5828         ; rlwinm r11, r11, 11, 0, 20  << 11
addi r11, r11, 1024
.uint 0x550CF6FA         ; rlwinm r12, r8, 30, 27, 29  predictor index * 4
add r12, r12, r4
.uint 0xA80C001C         ; lha r0, 28(r12)   first coefficient
.uint 0x7C0049D6         ; mullw r0, r0, r9
add r11, r11, r0
.uint 0xA80C001E         ; lha r0, 30(r12)   second coefficient
.uint 0x7C0051D6         ; mullw r0, r0, r10
add r11, r11, r0
.uint 0x7D6B5E70         ; srawi r11, r11, 11
cmpwi r11, 32767
ble _axDecNotHigh
li r11, 32767
_axDecNotHigh:
cmpwi r11, -32768
bge _axDecNotLow
li r11, -32768
_axDecNotLow:
.uint 0xB1660000         ; sth r11, 0(r6)
addi r6, r6, 2
mr r10, r9
mr r9, r11
addi r7, r7, 1
addi r5, r5, -1
cmpwi r5, 0
bgt _axDecLoop
_axDecDone:
blr

; both call sites of AXDecodeAdpcmData
0x02C69714 = bla _axDecodeAdpcmData
0x031B65CC = bla _axDecodeAdpcmData
