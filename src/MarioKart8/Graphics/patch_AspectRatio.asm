[MK8_AspectRatio_Shared]
moduleMatches = 0x9F0A90B7,0xD09700CE,0x1D398493,0xBA6B1E20,0x62A5F023,0x2A2DC82C

.origin = codecave

aspectRatio:
.float ((($gameHeight/$height)*$width)/$gameWidth)

scaleAspectRatioCalc:
fdivs f9, f13, f12
lis r7, aspectRatio@ha
lfs f12, aspectRatio@l(r7)
fmuls f7, f9, f12
blr


[MK8_AspectRatio_V42]
moduleMatches = 0x9F0A90B7

0x024AEF70 = bla scaleAspectRatioCalc

0x100C359C = .float ($width/$height)
0x10121E30 = .float ($width/$height)


[MK8_AspectRatio_V41]
moduleMatches = 0xD09700CE

0x024AEBEC = bla scaleAspectRatioCalc

0x100C359C = .float ($width/$height)
0x10121E30 = .float ($width/$height)


[MK8_AspectRatio_V4]
moduleMatches = 0x1D398493

0x024AEBEC = bla scaleAspectRatioCalc

0x100C359C = .float ($width/$height)
0x10121D30 = .float ($width/$height)


[MK8_AspectRatio_V3]
moduleMatches = 0xBA6B1E20

0x024642E8 = bla scaleAspectRatioCalc

0x100AC25C = .float ($width/$height)
0x1010A730 = .float ($width/$height)


[MK8_AspectRatio_V2]
moduleMatches = 0x62A5F023

0x024376D4 = bla scaleAspectRatioCalc

0x1009E9DC = .float ($width/$height)
0x100FC030 = .float ($width/$height)


[MK8_AspectRatio_V1]
moduleMatches = 0x2A2DC82C

0x02416760 = bla scaleAspectRatioCalc

0x10097D94 = .float ($width/$height)
0x100F3430 = .float ($width/$height)
