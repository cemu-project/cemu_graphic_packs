[MarioKart8_UnlockVehicleParts]
moduleMatches = 0x9F0A90B7, 0xD09700CE ; v4.2(EU/NA/JP), v4.1(EU/NA/JP)
.origin = codecave

UnlockVehicleParts:
;r28 = 0x2e6b66D0
li r3, 3

;Kart Frames
lbz r0, 0xD(r28)
li r12, 26
mtctr r12
addi r12, r28, -1
_forloopWritePartsFrames:
 stbu r3, 1(r12)
 bdnz _forloopWritePartsFrames
stb r0, 0xD(r28)

;Tires
lbz r0, 0x40+0x11(r28)
li r12, 18
mtctr r12
addi r12, r28, 0x40-1
_forloopWritePartsTires:
 stbu r3, 1(r12)
 bdnz _forloopWritePartsTires
stb r0, 0x40+0x11(r28)

;Gliders
lbz r0, 0x80+0xB(r28)
li r12, 12
mtctr r12
addi r12, r28, 0x80-1
_forloopWritePartsGliders:
 stbu r3, 1(r12)
 bdnz _forloopWritePartsGliders
stb r0, 0x80+0xB(r28)

;check if gold parts cheat is enabled
li r0, 0
cmpwi r0, $goldpartscheat
beq UnlockVehicleParts_Exit
stb r3, 0xD(r28)
stb r3, 0x40+0x11(r28)
stb r3, 0x80+0xB(r28)

UnlockVehicleParts_Exit:
lbzx r12, r28, r30
blr

[MarioKart8_UnlockVehicleParts_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
0x024DB044 = bla UnlockVehicleParts

[MarioKart8_UnlockVehicleParts_v41]
moduleMatches = 0xD09700CE ; v4.1(EU/NA/JP)
0x024DACC0 = bla UnlockVehicleParts
