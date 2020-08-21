[BotW_ExtendedMemory_V208]
moduleMatches = 0x6267BFD0

; BotW's heap system is quite complex with heaps being allocated within heaps. This work-in-progress hack only expands the size of a few important heaps

; Useful functions:
; CreateHeap (inside other heap) 0x3624FAC and 0x3624108
; Another CreateHeap function (unknown purpose) 0x30A857C

0x02C5E660 = lis r9, 0x8B60 ; add 0x50000000 to main gameheap which by default has a fixed size of 0x3B600000. Can't make it larger due to overlay arena being in the way

SaveAreaHeapSize 			= 8 * 1024 * 1024; // 8MiB (default is 2312KiB)
TriggerParamHeapSize 		= 8 * 1024 * 1024; // 8MiB (default is around 2616KiB)
HavokMainHeapSize 			= 80 * 1024 * 1024; // 80MiB (default is 30MiB) 

; GameDataHeap
0x032015E0 = lis r3, (SaveAreaHeapSize@ha + TriggerParamHeapSize@ha)
								
; GameDataHeap -> SaveArea heap
0x03201A44 = lis r3, SaveAreaHeapSize@ha				
0x03201A5C = addi r3, r3, SaveAreaHeapSize@l

; GameDataHeap -> TriggerParam 
; Uses the remaining allocatable size of GameDataHeap
; Heap creation is near 0x03201174

; HavokMainHeap
0x037FD6A4 = lis r6, HavokMainHeapSize@ha

; Overlay arena
0x030AA5F4 = lis r7, 0x4000 ; expand overlay arena root heap size to 0x40000000 (1GiB) from default 0x1C000000 (448MiB). Can't make it larger due to forground bucket memory being in the way (starts at 0xE0000000)
                            ; Extra size for overlay arena from rules.txt is 0x24000000 (576MiB)
; Overlay arena -> FixedHeap
0x034ED614 = lis r3, 0x0C20 + 0x1000 ; add 256MiB

; Overlay arena -> MoveableMemoryHeap
0x034ED66C = lis r3, 0x0FD0 + 0x1000 ; add 256MiB