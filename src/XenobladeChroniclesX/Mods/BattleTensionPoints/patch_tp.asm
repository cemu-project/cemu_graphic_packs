[XCX_BootWithTP]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
BoolBootWithTP:
.uint 0

_BootWithTP:
li r3, $everyloadingscreen
cmpwi r3, 0
bne _applymaxTP
lis r3, BoolBootWithTP@ha
lwz r3, BoolBootWithTP@l(r3)
cmpwi r3, 0
bne+ _BootWithTPExit
_applymaxTP:
lwz r3,0x98(r10)
stw r3,0x94(r10)
lis r3, BoolBootWithTP@ha
stw r3, BoolBootWithTP@l(r3)
_BootWithTPExit:
li r3, 1
blr

[XCX_BootWithTP_v101E_v102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x02367C1C = bla _BootWithTP
0x025B50A4 = lwz r3,0x94+$memoffset(r12)

[XCX_BootWithTP_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02367450 = bla _BootWithTP
0x025B4680 = lwz r3,0x94+$memoffset(r12)

[XCX_BootWithTP_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02367BAC = bla _BootWithTP
0x025B5034 = lwz r3,0x94+$memoffset(r12)

[XCX_BootWithTP_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x023672DC = bla _BootWithTP
0x025B3BA4 = lwz r3,0x94+$memoffset(r12)
