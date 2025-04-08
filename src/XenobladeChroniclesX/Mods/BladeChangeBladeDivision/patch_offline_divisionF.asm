[XCX_OFFLINE_DivisionF]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

_forceChangeDivision:
li r3, $division
stw r3, 0xc4(r12)
blr

[XCX_OFFLINE_DivisionF_v101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x0288D39C = ba _forceChangeDivision
0x0288D3B8 = ba _forceChangeDivision
;0x02AC623C = li r3, 0 ; offline__Q2_4menu19CTerminalMenu_UnionFv ;makes the division option show up on the blade terminal but just softlocks if selecting currently

[XCX_OFFLINE_DivisionF_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x0288D39C = ba _forceChangeDivision
0x0288D3B8 = ba _forceChangeDivision
;0x02AC622C = li r3, 0 ; offline__Q2_4menu19CTerminalMenu_UnionFv

[XCX_OFFLINE_DivisionF_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x0288A2FC = ba _forceChangeDivision
0x0288A318 = ba _forceChangeDivision
;0x02AC28FC = li r3, 0

[XCX_OFFLINE_DivisionF_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0288D320 = ba _forceChangeDivision
0x0288D33C = ba _forceChangeDivision
;0x02AC61B0 = li r3, 0

[XCX_OFFLINE_DivisionF_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02888F24 = ba _forceChangeDivision
0x02888F40 = ba _forceChangeDivision
;0x02AC0B14 = li r3, 0
