[XCX_MAXTICKETS_ALL] ##########################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

; cfs::CfSocialManager::getTradeTicketMax(const(void))
_maxtickets:
cmpwi r3, 10
blt levels
lis r3, 0x0001
ori r3, r3, 0x869F
blr
levels:
lwz r3, 0x1EC(r9)
mulli r3, r3, 10
blr

[XCX_MAXTICKETS] ##########################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x022CA810 = bla _maxtickets
0x022CA834 = bla _maxtickets

[XCX_MAXTICKETS_1U] ##########################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x022CA7A0 = bla _maxtickets
0x022CA7C4 = bla _maxtickets
