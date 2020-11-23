[Bayo2USv0]
moduleMatches = 0xAF5D1A85
.origin = codecave
	
_enable60:
.int 1

_cave60:
lis r9, _enable60@ha
lwz r9, _enable60@l(r9)
cmpwi r9, 1
bne skipTo30
addi r0,r10,1
blr
skipTo30:
xori r0,r10,2
blr

0x03351098 = bla _cave60
