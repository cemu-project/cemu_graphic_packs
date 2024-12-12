[Shiftlings_60fps]
moduleMatches = 0x7BDCC1EE ; (EU/NA)
.origin = codecave

_60fps:
lwz r31,0xc(r1)            ; Replace the hook
lis r8,0x1002              ; Load upper half of address to register
lis r9,0x42F0              ; Load upper half of .float 120.0 into register
stw r9,0x6F70(r8)          ; Store floatstored in register to 0x40E31574
blr                        ; return

0x026DF968 = bla _60fps    ; Hook
