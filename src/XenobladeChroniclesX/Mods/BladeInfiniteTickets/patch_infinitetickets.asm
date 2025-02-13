[XCX_InfiniteTickets]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

ticketammount = $ticketammount
miraniumammount = $miraniumammount
moneyammount = $moneyammount

InfiniteTickets:
lis r3, ticketammount@hi
ori r3, r3, ticketammount@l
blr

InfiniteMiranium:
lis r3, miraniumammount@hi
ori r3, r3, miraniumammount@l
blr

InfiniteMoney:
lis r3, moneyammount@hi
ori r3, r3, moneyammount@l
blr

[XCX_InfiniteTickets_v101E_v102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x027F6B50 = ba InfiniteMoney
0x027F6CA8 = ba InfiniteTickets
0x027F6D44 = ba InfiniteMiranium

[XCX_InfiniteTickets_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x027F46F4 = ba InfiniteMoney
0x027F484C = ba InfiniteTickets
0x027F48E8 = ba InfinitMiranium

[XCX_InfiniteTickets_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x027F6AD4 = ba InfiniteMoney
0x027F6C2C = ba InfiniteTickets
0x027F6CC8 = ba InfiniteMiranium

[XCX_InfiniteTickets_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x027F36C8 = ba InfiniteMoney
0x027F3820 = ba InfiniteTickets
0x027F38BC = ba InfiniteMiranium
