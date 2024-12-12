[ResidentEvilRevelations_60fps_v16]
moduleMatches = 0x0BA5CE64, 0x9FD08437, 0x1818A411 ; v16(EU), v16(NA), v16(JP)
.origin = codecave
floatAddress = 0x40E28574
_60fps:
lis r9,0x4270              ; Load upper half of .float 60.0 into register
lis r8,floatAddress@ha     ; Load upper half of address to register
stw r9,floatAddress@l(r8)  ; Store floatstored in register to 0x40E28574
fmr f1,f27                 ; Replace the hook
blr                        ; return

[ResidentEvilRevelations_60fps_EUv16]
moduleMatches = 0x0BA5CE64 ; v16(EU)
0x02D1C9C0 = bla _60fps

[ResidentEvilRevelations_60fps_NAv16]
moduleMatches = 0x9FD08437 ; v16(NA)
0x02D1C9D8 = bla _60fps

[ResidentEvilRevelations_60fps_JPv16]
moduleMatches = 0x1818A411 ; v16(JP)
0x02D1C70C = bla _60fps


[ResidentEvilRevelations_60fps_v0]
moduleMatches = 0x422EE27A, 0x8B15F48B, 0xB3118882 ; v0(EU), v0(NA), v0(JP)
.origin = codecave
floatAddress = 0x40E31574
_60fps:
lis r9,0x4270              ; Load upper half of .float 60.0 into register
lis r8,floatAddress@ha     ; Load upper half of address to register
stw r9,floatAddress@l(r8)  ; Store floatstored in register to 0x40E31574
fmr f1,f27                 ; Replace the hook
blr                        ; return

[ResidentEvilRevelations_60fps_EUv0]
moduleMatches = 0x422EE27A ; v0(EU)
0x02D1B494 = bla _60fps

[ResidentEvilRevelations_60fps_NAv0]
moduleMatches = 0x8B15F48B ; v0(NA)
0x02D1B4AC = bla _60fps

[ResidentEvilRevelations_60fps_JPv0]
moduleMatches = 0xB3118882 ; v0(JP)
0x02D1B1E0 = bla _60fps


[ResidentEvilRevelations_60fps_vDemo]
moduleMatches = 0xF1C5863A, 0xC4099CCF, 0x02A564AB ; demo(EU), demo(NA), demo(JP)
.origin = codecave
floatAddress = 0x40DB6574
_60fps:
lis r9,0x4270              ; Load upper half of .float 60.0 into register
lis r8,floatAddress@ha     ; Load upper half of address to register
stw r9,floatAddress@l(r8)  ; Store floatstored in register to 0x40DB6574
fmr f1,f27                 ; Replace the hook
blr                        ; return

[ResidentEvilRevelations_60fps_EUvDemo]
moduleMatches = 0xF1C5863A ; demo(EU)
0x02CF55E0 = bla _60fps

[ResidentEvilRevelations_60fps_NAvDemo]
moduleMatches = 0xC4099CCF ; demo(NA)
0x02CF55EC = bla _60fps

[ResidentEvilRevelations_60fps_JPvDemo]
moduleMatches = 0x02A564AB ; demo(JP)
0x02CF5338 = bla _60fps
