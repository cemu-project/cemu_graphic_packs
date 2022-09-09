[XCX_DAMAGES]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J

.origin = codecave
.int $divr
_divide_dmg:
li r4, $divr
divw r4, r31, r4
blr

[XCX_DAMAGES_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x0295B678 = li r3, -1-$divr
0x025D896C = bla _divide_dmg

[XCX_DAMAGES_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x0295B668 = li r3, -1-$divr
0x025D896C = bla _divide_dmg

;[XCX_DAMAGES_V102J]
;DO NOT port to JP 1.0.2 untill official game servers go offline

[XCX_DAMAGES_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0295B5EC = li r3, -1-$divr
0x025D88FC = bla _divide_dmg

[XCX_DAMAGES_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02956D10 = li r3, -1-$divr
0x025CD268 = bla _divide_dmg
