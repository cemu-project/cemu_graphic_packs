[DEM2GreenFixVer0]
moduleMatches = 0x7d954baf

.origin = codecave

_codeCaveFunction:
lis r3, 0x13ad
addi r3, r3, 0x7b7f
li r4, 1
stb r4, 0(r3)
lwz r9,0x4(r23)
blr

0x021BEAF0 = bla _codeCaveFunction