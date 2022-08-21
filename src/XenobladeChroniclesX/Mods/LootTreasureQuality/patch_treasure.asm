[XCX_LOOT_FORCECHEST]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $forced
.int $treasure

; ----------------------------------------------------------------------------
; WHO  : ItemDrop::CItemDropManager::calcRank((unsigned short, int))
; WHAT : Force the chest quality
_goForced:
li r28, $treasure
li r4, $forced
cmpwi r4, 1
bne exit_goForced
mr. r28, r28
blr
exit_goForced:
mr. r28, r3
blr


[XCX_LOOT_FORCECHEST_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
0x021AAFA4 = bla _goForced
; ----------------------------------------------------------------------------
; WHO  : ItemDrop::CItemDropManager::calcRank((unsigned short, int))
; WHAT : Override the chest quality you get when the game initially decided you get no chest at all
;      : It's a bit tough to explain, but the function calcRank does this:
;      : 1) Calculate luck for gold chest, if success exit with gold quality (1), else process next step
;      : 2) Calculate luck for silver chest, if success exit with silver quality (2), else process next step
;      : 3) Calculate luck for bronze chest, if success exit with bronze quality (3), else process next step
;      : 4) No chest at all, exit with no chest (0)
;      : --> The mod below only changes this last step. So even if you put value 1 (gold chest), you'll still get a silver chest if the game succeeded the step 2.
0x021AAF18 = li r3, $treasure

[XCX_LOOT_FORCECHEST_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021AAA70 = bla _goForced
0x021AA9E4 = li r3, $treasure

[XCX_LOOT_FORCECHEST_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021AA7EC = bla _goForced
0x021AA760 = li r3, $treasure
