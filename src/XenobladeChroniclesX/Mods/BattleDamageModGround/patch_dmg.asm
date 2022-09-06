[XCX_DAMAGES]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mult

[XCX_DAMAGES_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x025D896C = mulli r4, r31, $mult

;[XCX_DAMAGES_V102J]
;DO NOT port to JP 1.0.2 untill official game servers go offline

[XCX_DAMAGES_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x025D88FC = mulli r4, r31, $mult

[XCX_DAMAGES_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x025CD268 = mulli r4, r31, $mult
