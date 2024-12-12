[HyruleWarriors_BlurRemoval]
moduleMatches = 0xE159AE91, 0xDE6FF9D3, 0xF290AEA8 ; v208(EU/NA/JP), v0(EU/NA), v16(JP)
.origin = codecave

; function that nulls out fields meant to be set by ktgl::CCafeGraphicsDevice::GetViewport
_nullViewport:
li r4, 0
stw r4, 0x0(r3)
stw r4, 0x4(r3)
stw r4, 0x8(r3)
stw r4, 0xC(r3)
stw r4, 0x10(r3)
stw r4, 0x14(r3)
blr


[HyruleWarriors_BlurRemoval_v208]
moduleMatches = 0xE159AE91 ; v208(EU/NA/JP)
; patch DoF call to ktgl::CCafeGraphicsDevice::GetViewport to use our nulling out function instead
0x02878FAC = bla _nullViewport

[HyruleWarriors_BlurRemoval_EUv0]
moduleMatches = 0xDE6FF9D3 ; v0(EU/NA)
0x027CE3D8 = bla _nullViewport

[HyruleWarriors_BlurRemoval_JPv16]
moduleMatches = 0xF290AEA8 ; v16(JP)
0x027CDBB0 = bla _nullViewport
