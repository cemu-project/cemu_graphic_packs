[XCX_MoveSpeedDollFlight]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

VarSpeedDollFlight:
	.float $mod ; horizontal flight speed (smallest means fastest, default is 1.0)
VarSpeedDollFlightHeight:
	.float $modHeight ; vertical flight speed (smallest means fastest, default is 1.0)

_setSpeedDollFlight:
lis       r4, VarSpeedDollFlight@ha
lfs       f13, VarSpeedDollFlight@l(r4)
fdivs     f1, f1, f13
li        r4, 0x66
blr

_setSpeedDollFlightHeight:
lis       r3, VarSpeedDollFlightHeight@ha
lfs       f13, VarSpeedDollFlightHeight@l(r3)
fdivs     f1, f1, f13
lwz       r3, 0(r31)
blr


[XCX_MoveSpeedDollFlight_v101E_v102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;updateBlendWeights__Q2_3chr17CDL_HoverDashLoopFv
;horizontal speed
0x02625164 = bla _setSpeedDollFlight ; SetVariableFloat(0x66,float)
;upward verical speed
0x02625170 = bla _setSpeedDollFlightHeight ;SetVariableFloat(0x125,float)
;downward verical speed
0x02625180 = bla _setSpeedDollFlightHeight ;SetVariableFloat(0x126,float)

[XCX_MoveSpeedDollFlight_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02624740 = bla _setSpeedDollFlight ;horizontal speed
0x0262474C = bla _setSpeedDollFlightHeight ;upward speed
0x0262475C = bla _setSpeedDollFlightHeight ;downward speed

[XCX_MoveSpeedDollFlight_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x026250F4 = bla _setSpeedDollFlight ;horizontal speed
0x02625100 = bla _setSpeedDollFlightHeight ;upward speed
0x02625110 = bla _setSpeedDollFlightHeight ;downward speed

[XCX_MoveSpeedDollFlight_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02623C64 = bla _setSpeedDollFlight ;horizontal speed
0x02623C70 = bla _setSpeedDollFlightHeight ;upward speed
0x02623C80 = bla _setSpeedDollFlightHeight ;downward speed
