[LostReavers_60Fps]
moduleMatches = 0x165809E9, 0x67DBF490, 0x596FA658, 0xC86E968A ; v16(EU/NA/JP), v0/betatest(EU/NA), v0(JP), betatest(JP)
.origin = codecave
; Code selects .float 60 from 0x1000333C
_60fps:
lis r3,0x1000
lfs f1,0x333c(r3)
blr

[LostReavers_60Fps_v16]
moduleMatches = 0x165809E9, 0x67DBF490 ; v16(EU/NA/JP), v0/betatest(EU/NA)
0x02571FC4 = ba _60fps   ; nop - Remove read to FPS .float = uncapped FPS

[LostReavers_60Fps_JPv0]
moduleMatches = 0x596FA658 ; v0(JP)
0x02571F94 = ba _60fps

[LostReavers_60Fps_JPbetatest]
moduleMatches = 0xC86E968A ; betatest(JP)
0x0257163C = ba _60fps
