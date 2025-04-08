[XCX_RemoveBattleUI_Arts_v101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
;remove arts pallet
0x02a8ace4 = nop ;draw__Q2_4menu15MenuArtsPaletteFv
;fixes camera bug when skip traveling
0x02769448 = blr ;move__Q2_2ev12CCamPlayableFf
;???
;0x02c6b248 = nop ;close arts pallet

[XCX_RemoveBattleUI_Arts_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02a8acd4 = nop ;draw__Q2_4menu15MenuArtsPaletteFv
0x02769448 = blr ;move__Q2_2ev12CCamPlayableFf
;0x02c6b1e8 = nop ;close arts pallet

[XCX_RemoveBattleUI_Arts_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02a8724c = nop ;draw__Q2_4menu15MenuArtsPaletteFv
0x02767bc0 = blr ;move__Q2_2ev12CCamPlayableFf
;0x02c6675c = nop ;close arts pallet

[XCX_RemoveBattleUI_Arts_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02a8ac58 = nop ;draw__Q2_4menu15MenuArtsPaletteFv
0x027693e8 = blr ;move__Q2_2ev12CCamPlayableFf
;0x02c6b070 = nop ;close arts pallet

[XCX_RemoveBattleUI_Arts_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02a855a0 = nop ;draw__Q2_4menu15MenuArtsPaletteFv
0x02766c50 = blr ;move__Q2_2ev12CCamPlayableFf
;0x02c62c48 = nop ;close arts pallet
