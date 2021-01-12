[BotW_ExtendedMemory_V208]
moduleMatches = 0x6267BFD0

.origin = codecave

0x02C5E660 = lis r9, 0x8B60 ; add 0x50000000 to main gameheap which by default has a fixed size of 0x3B600000. Can't make it larger due to overlay arena being in the way

SaveAreaHeapSize 			= 8 * 1024 * 1024 ; 8MiB (default is 2312KiB)
TriggerParamHeapSize 		= 8 * 1024 * 1024 ; 8MiB (default is around 2616KiB)
HavokMainHeapSize 			= 80 * 1024 * 1024 ; 80MiB (default is 30MiB) 

; GameDataHeap
0x032015E0 = lis r3, (SaveAreaHeapSize@ha + TriggerParamHeapSize@ha)

; GameDataHeap -> SaveArea heap
0x03201A44 = lis r3, SaveAreaHeapSize@ha				
0x03201A5C = addi r3, r3, SaveAreaHeapSize@l

; GameDataHeap -> TriggerParam 
; Uses the remaining allocatable size of GameDataHeap

; HavokMainHeap
0x037FD6A4 = lis r6, HavokMainHeapSize@ha

; Overlay arena
0x030AA5F4 = lis r7, 0x4000 ; expand overlay arena root heap size to 0x40000000 (1GiB) from default 0x1C000000 (448MiB). Can't make it larger due to forground bucket memory being in the way (starts at 0xE0000000)
                            ; Extra size for overlay arena from rules.txt is 0x24000000 (576MiB)
; Overlay arena -> FixedHeap
0x034ED614 = lis r3, 0x0C20 + 0x1000 ; add 256MiB

; Overlay arena -> MoveableMemoryHeap
0x034ED66C = lis r3, 0x0FD0 + 0x1000 ; add 256MiB

; Increase the size of the resource heap for small resources. When using mods like e.g. draw distance this would likely be the reason why it would spawn panic moons.
_increaseResourceSmallHeap:
lwz r10, 0x70(r24)
addis r10, r10, 0x500
stw r10, 0x70(r24)
blr

0x037EAADC = bla _increaseResourceSmallHeap

; Increase the size of the resource heap for large resources. When using mods like e.g. draw distance this would likely be the reason why it would spawn panic moons.
_increaseResourceLargeHeap:
lwz r11, 0x6C(r24)
addis r11, r11, 0x500
stw r11, 0x6C(r24)
blr

0x037EAB84 = bla _increaseResourceLargeHeap

; Some notes on potential further heaps

; The function at 0x030A5FA0 is the sead::ExpHeap::create function, which is used for pretty much all of BotW's heap creations.
; 0x02C235A0 = KingSystem -> uking::frm::System -> StageBinder
; 0x030A9E7C = Could be used to increase the sead::Arena size. Might already be increased.
; A lot of heaps inside the function at 0x034ED524 are used to initialize individual heaps
; 0x034ED55C = Overlay arena -> FixedHeap -> GameDataWork
; 0x034ECFCC = Overlay arena -> FixedHeap -> ForOverlayArena
; 0x034ECED8 = Overlay arena -> FixedHeap -> TexArcWork
; 0x034ED4EC = Overlay arena -> FixedHeap -> PlacementTree
; 0x034ED884 = Overlay arena -> SZSDecompressorInst
; 0x0309F1AC = ? -> SeadResourceMgr
; 0x037A19B0 = ? -> ActorFactory Related 1 - This could be used to increase the size that a heap can have.
; 0x037AE978 = ? -> ActorFactory Related 2 - This could be used to increase the size that a heap can have.
; 0x03B3EA40 = ? -> AglWorkHeap
; Heap creation is near 0x03201174