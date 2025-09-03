[ScreenOrientation]
moduleMatches = 0x1A03E108, 0xA3175EEA

.origin = codecave

_modifierValue:
.byte $orientation

orientationlogic:
lis r3,_modifierValue@ha
lbz r0, _modifierValue@l(r3)
stb r0, +0x667d(r11)
blr

0x029481AC = bla orientationlogic
0x1012667D = .byte $orientation

