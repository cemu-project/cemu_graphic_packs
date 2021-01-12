[BotW_DrawDistance_V208]
moduleMatches = 0x6267BFD0

.origin = codecave

actorMultiplier:
.float $actor

_replaceDrawDistanceActorInvoke:
lis r12, actorMultiplier@ha
lfs f13, actorMultiplier@l(r12)
fmuls f1, f1, f13
lwz r12, 0x3B0(r29)
blr

0x037A617C = bla _replaceDrawDistanceActorInvoke

_replaceDrawDistanceActorKeepAlive_1:
lis r4, actorMultiplier@ha
lfs f6, actorMultiplier@l(r4)
fmuls f1, f1, f6
lwz r4, 0x4FC(r31)
blr

0x0379E6B8 = bla _replaceDrawDistanceActorKeepAlive_1

_replaceDrawDistanceActorKeepAlive_2:
lis r23, actorMultiplier@ha
lfs f9, actorMultiplier@l(r23)
fmuls f1, f1, f9
lfs f9, 0x280(r31)
blr

0x0379E63C = bla _replaceDrawDistanceActorKeepAlive_2

objectMultiplier:
.float $object

_replaceObjectDrawDistance:
lis r9, objectMultiplier@ha
lfs f11, objectMultiplier@l(r9)
fmuls f1, f1, f11
lwz r0, 0xC(r1)
blr

0x03137F04 = bla _replaceObjectDrawDistance