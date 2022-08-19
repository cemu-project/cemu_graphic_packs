; DO NOT add 1.0.2J support untill official XCX game servers go offline
; DO NOT add 1.0.2U, 1.0.1E or 1.0.0E support untill official XCX game servers go offline
;hi regwus, <3<3 intra <3<3

[XCX_DAMAGES_V1] ; ####################################################################################################################################
moduleMatches = 0x785CA8A9

.origin = codecave

.int $mult

0x025CD268 = mulli r4, r31, $mult

[XCX_DAMAGES_V2] ; ####################################################################################################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E

.origin = codecave

.int $mult

0x025D88FC = mulli r4, r31, $mult
