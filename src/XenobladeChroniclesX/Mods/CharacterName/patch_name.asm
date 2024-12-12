[XCX_Name]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

_playerName:
;char 1-4
lis r8, $char0102
ori r8, r8, $char0304
stw r8, $memoffset+0x0 (r12)
;char 5-8
lis r8, $char0506
ori r8, r8, $char0708
stw r8, $memoffset+0x4 (r12)
;char 9-12
lis r8, $char0910
ori r8, r8, $char1112
stw r8, $memoffset+0x8 (r12)
;char 13-16
lis r8, $char1314
ori r8, r8, $char1516
stw r8, $memoffset+0xC (r12)
;char 17-20
lis r8, $char1718
ori r8, r8, $char1920
stw r8, $memoffset+0x10 (r12)
;char 21-24
lis r8, $char2122
ori r8, r8, $char2324
stw r8, $memoffset+0x14 (r12)
;char 25-28
lis r8, $char2526
ori r8, r8, $char2728
stw r8, $memoffset+0x18 (r12)
;char 29-32
lis r8, $char2930
ori r8, r8, $char3132
stw r8, $memoffset+0x1C (r12)
;char 33-36
lis r8, $char3334
ori r8, r8, $char3536
stw r8, $memoffset+0x20 (r12)
;char 37-40
lis r8, $char3738
ori r8, r8, $char3940
stw r8, $memoffset+0x24 (r12)
;char 41-44
lis r8, $char4142
ori r8, r8, $char4344
stw r8, $memoffset+0x28 (r12)
;char 45-48
lis r8, $char4546
ori r8, r8, $char4748
stw r8, $memoffset+0x2C (r12)
;char 49-52
lis r8, $char4950
ori r8, r8, $char5152
stw r8, $memoffset+0x30 (r12)

;fixes the line we over wrote
addi r8,r12,0xa7
blr

[XCX_Name_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;GetMyAvatar__Q2_2fw4UtilFRQ2_2fw7SPcData
0x027F6EEC = bla _playerName

[XCX_Name_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027F4A70 = bla _playerName

[XCX_Name_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027F6E50 = bla _playerName

[XCX_Name_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027F3A44 = bla _playerName
