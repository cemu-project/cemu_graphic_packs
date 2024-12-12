[MarioSonicRio2016_60fps]
moduleMatches = 0xD44C22E3, 0xE0E2BBA7 ; (EU/NA), (JP)
.origin = codecave
_60fps:
lis r3,0x1000
lfs f0,0x45b0(r3)
blr

0x0298AA0C = bla _60fps


[MarioSonicRio2016_60fps_vDemo]
moduleMatches = 0x60481B3F ; demo(EU/JP)
.origin = codecave
_60fps:
lis r3,0x1000
lfs f0,0x45f4(r3)
blr

0x027DB680 = bla _60fps
