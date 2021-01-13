[BotW_FenceMethod_V208]
moduleMatches = 0x6267BFD0

.origin = codecave

# variables
_fenceMethod: # stores fence method mode from preset
.int $fenceMethod

_conditionalPerformanceFence:
lis r11, _fenceMethod@ha
lwz r11, _fenceMethod@l(r11) ; Load the fence method value
cmpwi r11, 1 ; Compare the skip fence method with the fence method that's set, store comparison to the conditional register
bne .+0x0C ; If the conditional register isn't equel to the performance fence method, skip the next two instructions
li r0, 1 # Performance fence always set the fence skip value to 1
blr ; Return to the instruction that jumped to this part to the code cave
lwz r0, 0x388(r31) ; Instruction that gets executed if performance fence isn't used, this is the original instruction.
blr ; Return to the instruction that jumped to this part to the code cave

# Accurate and Skip Fence methods

_conditionalAccurateAndSkipFence:
lis r5, _fenceMethod@ha
lwz r11, _fenceMethod@l(r5) ; Load the fence method value
cmpwi r11, 2 ; Compare the accurate fence method with the fence method that's set, store comparison to the conditional register
li r5, 6 ; Original instruction that got replaced with the jump
add r6, r12, r0 ; Instruction that got replaced with the fence skip check
bne .+0x10 ; If the conditional register isn't equel to accurate fence, skip the next three instructions (the ones that are the accurate fence) to the next comparison instruction.
cmpwi r6, 500 # Accurate fence basically checks if it's the first 500 frames of the game, in which case it does a full fence.
blt .+0x08
subi r6, r6, 1
cmpwi r11, 3 ; Compare the skip fence method with the fence method that's set, in preparation of the fence skip since it stores the result in the conditional register.
blr ; Return to the instruction that jumped to this part to the code cave

0x31FAAE8 = bla _conditionalPerformanceFence ; Jumps to the conditional performance part of the code cave that creates the performance fence skip if that preset has been chosen.
0x31FAAF8 = bla _conditionalAccurateAndSkipFence ; Jumps to the conditional accurate part of the code cave that creates the accurate fence skip if that preset has been chosen.
0x31FAAFC = beq .+0x08 ; This part is the crucial part of the fence skip method. It skips the GX2SetGPUFence call in which case there's no fence skip, if the conditional register that has previously been set by the accurate code cave was true.