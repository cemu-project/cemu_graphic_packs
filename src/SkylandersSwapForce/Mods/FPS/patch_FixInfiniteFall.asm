[SSF_FixInfiniteFall]
moduleMatches = 0xa0b35374, 0xb1f102ec ; v16, v0
.origin = codecave

const_stuckFallingDistanceThreshold:
.float 20*30/$targetFPS

_getStuckFallingDistanceThreshold:
    lis r0, const_stuckFallingDistanceThreshold@ha
    lfs f0, const_stuckFallingDistanceThreshold@l(r0)
blr

[SSF_FixInfiniteFall_V16]
moduleMatches = 0xa0b35374 ; v16

0x0242729c = bla _getStuckFallingDistanceThreshold

[SSF_FixInfiniteFall_V0]
moduleMatches = 0xb1f102ec ; v0

0x02427214 = bla _getStuckFallingDistanceThreshold
