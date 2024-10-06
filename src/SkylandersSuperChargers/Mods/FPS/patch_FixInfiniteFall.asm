[SSC_FixInfiniteFall]
moduleMatches = 0xccf357b3, 0x1407432e, 0x3a1208f7, 0x21fc6048, 0x3e598867, 0xcf77bcd5, 0x25a11655
.origin = codecave

const_stuckFallingDistanceThreshold:
.float 20*30/$targetFPS

_getStuckFallingDistanceThreshold_f13:
    lis r0, const_stuckFallingDistanceThreshold@ha
    lfs f13, const_stuckFallingDistanceThreshold@l(r0)
blr

_getStuckFallingDistanceThreshold_f0:
    lis r0, const_stuckFallingDistanceThreshold@ha
    lfs f0, const_stuckFallingDistanceThreshold@l(r0)
blr

[SSC_FixInfiniteFall_V1]
moduleMatches = 0xccf357b3 ; v1

0x0220e028 = bla _getStuckFallingDistanceThreshold_f0

[SSC_FixInfiniteFall_V16]
moduleMatches = 0x1407432e ; 1.1.0

0x0220c35c = bla _getStuckFallingDistanceThreshold_f13

[SSC_FixInfiniteFall_V32]
moduleMatches = 0x3a1208f7 ; 1.2.0

0x0220d958 = bla _getStuckFallingDistanceThreshold_f13

[SSC_FixInfiniteFall_V48]
moduleMatches = 0x21fc6048 ; 1.3.0

0x0220f940 = bla _getStuckFallingDistanceThreshold_f13

[SSC_FixInfiniteFall_V64]
moduleMatches = 0x3e598867 ; 1.4.0

0x02210e78 = bla _getStuckFallingDistanceThreshold_f13

[SSC_FixInfiniteFall_V80]
moduleMatches = 0xcf77bcd5 ; 1.5.0

0x02212da8 = bla _getStuckFallingDistanceThreshold_f13

[SSC_FixInfiniteFall_V96_V97]
moduleMatches = 0x25a11655 ; 1.6.1 (v96 in US, v97 in EU)

0x02212da8 = bla _getStuckFallingDistanceThreshold_f13
