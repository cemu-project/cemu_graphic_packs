[SSC_FixInfiniteFall]
moduleMatches = 0x25a11655 ; 1.6.1E
.origin = codecave

const_stuckDistance:
.float 20*30/$targetFPS

_getStuckDistance:
    lis r0, const_stuckDistance@ha
    lfs f13, const_stuckDistance@l(r0)
blr

[SSC_FixInfiniteFall_V97]
moduleMatches = 0x25a11655 ; 1.6.1E
0x02212da8 = bla _getStuckDistance
