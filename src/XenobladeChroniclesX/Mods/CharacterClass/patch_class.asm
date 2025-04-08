[XCX_class]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

_classMemorJP100:
;reads from the static address that stores the address for the start of character info memory section
lis r11, 0x103a
lwz r11, -0x489c (r11)
b _charClassCheat

_classMemorUS100:
;reads from the static address that stores the address for the start of character info memory section
lis r11, 0x103a
lwz r11, -0x3e78 (r11)
b _charClassCheat

_classMemorJP102:
;reads from the static address that stores the address for the start of character info memory section
lis r11, 0x103a
lwz r11, -0x42b0 (r11)
b _charClassCheat

_classMemorEU101US102:
;reads from the static address that stores the address for the start of character info memory section
lis r11, 0x103a
lwz r11, -0x3d78 (r11)

_charClassCheat:
; Character class
li r9, $class
stb r9, $memoffset (r11)
; Character class rank
li r9, $rank
stb r9, $memoffset+2 (r11)
; Character class exp
li r9, $exp
sth r9, $memoffset+4 (r11)
;its seems that after a class hits its max rank,
;the rank counter continues to go up, the game just never shows you.
;I almost looped the full range, my rank exp on drifter is 0xeff9 out of 0xffff
;I think character exp works the same way
;sadly these mods destroy that value, even if we dont change the exp, just changing the rank/level does
;but the only way to even see them is to open up a hex editor

;fixes the line we over wrote
lis r11, 0x103a
blr

[XCX_Class_v101E_v102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; Our code applies when the reqMenuCreateParty function is used
0x023429FC = bla _classMemorEU101US102

[XCX_Class_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02342230 = bla _classMemorJP102

[XCX_Class_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x0234298C = bla _classMemorUS100

[XCX_Class_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x023420BC = bla _classMemorJP100
