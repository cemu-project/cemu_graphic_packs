[XCX_DAMAGES]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

_divide_dmg:
li r4, $mult
divw r4, r31, r4
blr

_mult_or_divide:
cmpwi r0, $multOrDivision
bne- _divide_dmg
mulli r4, r31, $mult
blr

[XCX_DAMAGES_V101E_102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x025D896C = bla _mult_or_divide

[XCX_DAMAGES_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x025D7F48 = bla _mult_or_divide

[XCX_DAMAGES_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x025D88FC = bla _mult_or_divide

[XCX_DAMAGES_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x025CD268 = bla _mult_or_divide

;kill online codes
;when this game still had online these used to be part of the mod
;0x02E0C5B0 = li r3, -1 ;1.0.1E, 1.0.0E
;0x02E0C550 = li r3, -1 ;1.0.2U
;0x02E07A78 = li r3, -1 ;1.0.2J
;0x02E0C3D8 = li r3, -1 ;1.0.1U, 1.0.0U
;0x02E03228 = li r3, -1 ;1.0.0J
