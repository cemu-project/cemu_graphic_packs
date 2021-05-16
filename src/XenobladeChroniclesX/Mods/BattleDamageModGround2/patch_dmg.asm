[XCX_DAMAGES]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

.int $divr

_divide_dmg:
li r4, $divr
divw r4, r31, r4
blr

0x025D896C = bla _divide_dmg

[XCX_DAMAGES_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

.origin = codecave

.int $mult

0x025D88FC = mulli r4, r31, $mult
