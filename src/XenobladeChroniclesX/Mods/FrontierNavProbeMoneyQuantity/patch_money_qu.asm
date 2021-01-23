[XCX_FN_MNY_QTY_ALL] ######################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $mod

_money:
li r31, $mod
mullw. r31, r31, r3
blr

[XCX_FN_MNY_QTY] ######################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x027D5588 = bla _money

[XCX_FN_MNY_QTY_1U] ######################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x027D5528 = bla _money
