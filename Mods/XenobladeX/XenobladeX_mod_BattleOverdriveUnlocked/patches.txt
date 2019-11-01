[XCX_OVERDRIVE]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

; ----------------------------------------------------------------------------
; WHO  : Gear::CGear::IsPermit((void))
; WHAT : Always returns true to unlock Overdrive even before chapter 5

0x021B70AC = li r3, 1
0x021B70C4 = li r3, 1
