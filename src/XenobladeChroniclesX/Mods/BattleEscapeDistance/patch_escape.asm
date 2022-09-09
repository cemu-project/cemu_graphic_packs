[XCX_RELEASEDIST]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9, 0x8780C48F ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J, 1.0.1J
.origin = codecave
; ----------------------------------------------------------------------------
; WHO  : cfs::CfCompoPropertyEnemy::getReleasePcDistanceXZ
; WHAT : Reduce escape distance from enemies (to lose aggro)

_distanceConst:
.float $mod
 
_getRelease:
lis r3, _distanceConst@ha
lfs f29, _distanceConst@l(r3)
fdivs f1, f1, f29
mr r3, r21
blr

; AI::CAIData::chkHoming
0x02030BE4 = bla _getRelease ; cfs::CfCompoPropertyEnemy::getReleasePcDistanceXZ
