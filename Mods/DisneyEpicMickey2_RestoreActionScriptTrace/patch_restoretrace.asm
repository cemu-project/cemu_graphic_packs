[DEM2RestoreASTraceVer0]
moduleMatches = 0x7d954baf

.origin = codecave

_codeCaveFunction:
lwz r3,0x8(r1)
lis r12, 0x03e0
addi r12, r12, 0x3967
addi r12, r12, 0x3967
addi r12, r12, 0x3967
addi r12, r12, 0x3967
mtctr r12
bctrl # call function

# original ending code
li r4, 0x2 # arg 2
addi r3,r1,0x8 # arg 1
lis r12, 0x0217
addi r12,r12,0x361c
mtctr r12
bctrl # call function
lwz r0,+0x14(r1)
lwz r31,+0xc(r1)
mtlr r0
addi r1,r1,0x10
blr

# 03388298
0x036d30ec = b _codeCaveFunction
0x036d3178 = b _codeCaveFunction
