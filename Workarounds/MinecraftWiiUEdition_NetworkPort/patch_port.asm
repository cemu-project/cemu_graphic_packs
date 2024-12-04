[MinecraftWiiU_ForceMultiplayerPortNumber_v688]
moduleMatches = 0x867317DE

# GetRandomPortRangeMin
.origin = 0x03579530
li  r3, 0
ori r3, r3, $port
blr

# GetRandomPortRangeMax
.origin = 0x0357953c
li  r3, 0
ori r3, r3, $port
blr
