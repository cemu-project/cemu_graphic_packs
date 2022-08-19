; DO NOT add 1.0.2J support untill official XCX game servers go offline
; DO NOT add 1.0.2U, 1.0.1E or 1.0.0E support untill official XCX game servers go offline

[XCX_DAMAGES]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B, 0x218F6E07, 0x676EB33E, 0x785CA8A9

.origin = codecave

.int $divr

_divide_dmg:
li r4, $divr
divw r4, r31, r4
blr


[XCX_DAMAGES_V1]
moduleMatches = 0x785CA8A9
0x025CD268 = bla _divide_dmg

[XCX_DAMAGES_V2]
moduleMatches = 0xAB97DE6B, 0x676EB33E
0x025D88FC = bla _divide_dmg
