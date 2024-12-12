[SlenderTheArival_60fps]
moduleMatches = 0xB3E3AB80, 0x3F3FA50A ; (EU), (NA)
.origin = codecave

_60fps:
lwz r31,0xc(r1)            ; Replace the hook
lis r8,0x1002              ; Load upper half of address to register
lis r9,0x42F0              ; Load upper half of .float 120.0 into register
stw r9,0x6F70(r8)          ; Store floatstored in register to 0x10026F70
blr                        ; return

0x026E1E88 = bla _60fps    ; Hook
