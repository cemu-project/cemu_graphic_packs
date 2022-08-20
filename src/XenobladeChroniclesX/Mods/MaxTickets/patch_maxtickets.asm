[XCX_MAXTICKETS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $cap

; cfs::CfSocialManager::getTradeTicketMax(const(void))
_maxtickets:
cmpwi r3, $cap
blt levels
lis r3, 0x0001
ori r3, r3, 0x869F
blr
levels:
lwz r3, 0x1EC(r9)
mulli r3, r3, $cap
blr

[XCX_MAXTICKETS_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x022CA810 = bla _maxtickets
0x022CA834 = bla _maxtickets

[XCX_MAXTICKETS_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x022CA040 = bla _maxtickets
0x022CA064 = bla _maxtickets

[XCX_MAXTICKETS_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x022CA7A0 = bla _maxtickets
0x022CA7C4 = bla _maxtickets

[XCX_MAXTICKETS_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x022C9ECC = bla _maxtickets
0x022C9EF0 = bla _maxtickets
