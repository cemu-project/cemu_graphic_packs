[FistofNorthStar_60fps_EU_NA]
moduleMatches = 0x2C5E8A55, 0x68342797 ; (EU), (NA)
;0x020EDABC = nop ;always 30fps
0x021352E0 = li r0,1 ;comic 60fps
0x02134F3C = li r9,1 ;cutscenes 60fps

[FistofNorthStar_60fps_JP]
moduleMatches = 0x048C84AA ; (JP)
;0x020EDABC = nop ;always 30fps
0x021350CC = li r0,1 ;comic 60fps
0x02134D28 = li r9,1 ;cutscenes 60fps

[FistofNorthStar_60fps_JPvUpdate]
moduleMatches = 0x250AAA3E ; vUpdate(JP)
;0x020EDB78 = nop ;always 30fps
0x02135314 = li r0,1 ;comic 60fps
0x02134F70 = li r9,1 ;cutscenes 60fps
