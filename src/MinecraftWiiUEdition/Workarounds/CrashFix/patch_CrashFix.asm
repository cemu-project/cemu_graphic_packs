[MinecraftWiiU_CrashFix_v688]
moduleMatches = 0x867317DE ; v688(EU/NA/JP)
;remove check for mii data
0x034FCE0C = b .+0x18
0x02BAA7A0 = b .+0x24

;TODO: Port to *EVERY* minecraft version
