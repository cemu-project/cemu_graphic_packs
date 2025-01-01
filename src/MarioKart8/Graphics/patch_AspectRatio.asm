[MarioKart8_AspectRatio]
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

[MarioKart8_AspectRatio_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
0x024AEF70 = bla scaleAspectRatioCalc
0x100C359C = .float ($width/$height)
0x10121E30 = .float ($width/$height)

[MarioKart8_AspectRatio_v41]
moduleMatches = 0xD09700CE ; v4.1(EU/NA/JP)
0x024AEBEC = bla scaleAspectRatioCalc
0x100C359C = .float ($width/$height)
0x10121E30 = .float ($width/$height)

[MarioKart8_AspectRatio_v4]
moduleMatches = 0x1D398493 ; v4.0(EU/NA/JP)
0x024AEBEC = bla scaleAspectRatioCalc
0x100C359C = .float ($width/$height)
0x10121D30 = .float ($width/$height)

[MarioKart8_AspectRatio_v3]
moduleMatches = 0xBA6B1E20 ; v3.0(EU/NA/JP)
0x024642E8 = bla scaleAspectRatioCalc
0x100AC25C = .float ($width/$height)
0x1010A730 = .float ($width/$height)

[MarioKart8_AspectRatio_v2]
moduleMatches = 0x62A5F023 ; v2.0(EU/NA/JP)
0x024376D4 = bla scaleAspectRatioCalc
0x1009E9DC = .float ($width/$height)
0x100FC030 = .float ($width/$height)

[MarioKart8_AspectRatio_v1]
moduleMatches = 0x2A2DC82C ; v1.0(EU/NA/JP)
0x02416760 = bla scaleAspectRatioCalc
0x10097D94 = .float ($width/$height)
0x100F3430 = .float ($width/$height)
