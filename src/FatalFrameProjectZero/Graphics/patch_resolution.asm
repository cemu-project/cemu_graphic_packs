[FatalFrame_Resolution_EU] ; Vanilla, Uncensored Patches
moduleMatches = 0xB54DBEB0, 0x5A9D6D31, 0x360FA109, 0x9D96F19B, 0x81551809, 0x77589D01, 0x2897C68C, 0x320A57BB
.origin = codecave

pointSpriteSize:
.int $width

0x026CF508 = lis r12, pointSpriteSize@ha
0x026CF510 = lwz r5, pointSpriteSize@l(r12)
0x026CF514 = lwz r6, pointSpriteSize@l(r12)

[FatalFrame_Resolution_NA] ; US eshop version, Unknown patches
moduleMatches = 0xE93B31F6, 0xC1F758BB, 0x3CC9A440
.origin = codecave

pointSpriteSize:
.int $width

0x026D0674 = lis r12, pointSpriteSize@ha
0x026D067C = lwz r5, pointSpriteSize@l(r12)
0x026D0680 = lwz r6, pointSpriteSize@l(r12)

[FatalFrame_Resolution_JP] ; Vanilla, Unknown Patches
moduleMatches = 0xA86AA5B2, 0x52992DCD, 0x60DC1C85
.origin = codecave

pointSpriteSize:
.int $width

0x02BDFCAC = lis r12, pointSpriteSize@ha
0x02BDFCB4 = lwz r5, pointSpriteSize@l(r12)
0x02BDFCB8 = lwz r6, pointSpriteSize@l(r12)
