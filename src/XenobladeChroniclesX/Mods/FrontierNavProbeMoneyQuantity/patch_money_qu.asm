[XCX_FN_MNY_QTY]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mod

_money:
li r31, $mod
mullw. r31, r31, r3
blr

[XCX_FN_MNY_QTY_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x027D5588 = bla _money

[XCX_FN_MNY_QTY_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027D31C0 = bla _money

[XCX_FN_MNY_QTY_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027D5528 = bla _money

[XCX_FN_MNY_QTY_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027D21BC = bla _money
