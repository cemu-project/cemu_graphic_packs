[SI_sigpatch_V16]
moduleMatches = 0x39E9EBC6 ; 1.1.0

0x02512D44 = li r3, 0
0x02512D48 = blr

[SI_sigpatch_V1]
moduleMatches = 0xC683642E ; 1.0.0

0x025121E8 = li r3, 0
0x025121EC = blr

[SI_sigpatch_demo]
moduleMatches = 0xAF023381 ; Demo

0x025101C4 = li r3, 0
0x025101C8 = blr