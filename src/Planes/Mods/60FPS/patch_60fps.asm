[Planes_60FPS]
moduleMatches = 0x6968CE40 ; (NA/EU)(1011c500)(10136a00)(10136900)
.origin = codecave
floatAddress = 0x100A180F
_CutScene60fps:
lis r11,floatAddress@ha    ; Load upper half of byte location
lbz r3,floatAddress@l(r11) ; load lower half (offset) 0x100A180F (byte switches between 0/1)
cmpwi r3, 0                ; Compare these two numbers
bne .+0x0C                 ; Jump to 3 instructions below if the comparison above is true
srwi r11, r12, 3           ; 60FPS
blr
srwi r11, r12, 2           ; 30FPS
blr

0x020C25A4 = bla _CutScene60fps         ;Jump to the code cave code
0X021BE7DC = li r3,1                    ; GX2SetSwapInterval sets 60FPS in game

[Planes_60FPS_EUv10136b00]
moduleMatches = 0x10464282 ; (EU)(10136b00)
.origin = codecave
floatAddress = 0x1009AFB7  ; may have gotten this address wrong
_CutScene60fps:
lis r11,floatAddress@ha    ; Load upper half of byte location
lbz r3,floatAddress@l(r11) ; load lower half (offset) 0x1009AFB7 (byte switches between 0/1)
cmpwi r3, 0                ; Compare these two numbers
bne .+0x0C                 ; Jump to 3 instructions below if the comparison above is true
srwi r11, r12, 3           ; 60FPS
blr
srwi r11, r12, 2           ; 30FPS
blr

0x020C1C1C = bla _CutScene60fps         ;Jump to the code cave code
0X021BDD28 = li r3,1                    ; GX2SetSwapInterval sets 60FPS in game
