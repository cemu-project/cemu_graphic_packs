[Bayonetta2_60fps]
moduleMatches = 0xAF5D1A85, 0xCCB72156 ; (EU/NA/JP), demo(EU/NA)
.origin = codecave

enable60:
.int 1

_cave60:
lis r9, enable60@ha
lwz r9, enable60@l(r9)
cmpwi r9, 1
bne _skipTo30
addi r0,r10,1
blr
_skipTo30:
xori r0,r10,2
blr

[Bayonetta2_60fps_]
moduleMatches = 0xAF5D1A85 ; (EU/NA/JP)
0x03351098 = bla _cave60

[Bayonetta2_60fps_vDemo]
moduleMatches = 0xCCB72156 ; demo(EU/NA)
0x031C03EC = bla _cave60
