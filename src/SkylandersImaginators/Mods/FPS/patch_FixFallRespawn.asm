[SI_FixInfiniteFall]
moduleMatches = 0xc683642e, 0x39e9ebc6 ; 1.0.0, 1.1.0
.origin = codecave

const_stuckFallingDistanceThreshold:
.float 20*30/$targetFPS

_getStuckFallingDistanceThreshold:
    lis r3, const_stuckFallingDistanceThreshold@ha
    lfs f13, const_stuckFallingDistanceThreshold@l(r3)
blr

[SI_FixInfiniteFall_V1]
moduleMatches = 0xc683642e ; 1.0.0

0x022c434c = bla _getStuckFallingDistanceThreshold

[SI_FixInfiniteFall_V16]
moduleMatches = 0x39e9ebc6 ; 1.1.0

0x022c4eb0 = bla _getStuckFallingDistanceThreshold
