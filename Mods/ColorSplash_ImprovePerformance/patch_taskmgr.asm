[SharedConstants]
moduleMatches = 0xca6b9a52, 0x7467d6cf

TASK_MGR_OBJ_SIZE = 0x3878 ; sys::task::Manager unmodified base size.
OS_SEMAPHORE_SIZE = 0x20
NEW_TASK_MGR_OBJ_SIZE = TASK_MGR_OBJ_SIZE + OS_SEMAPHORE_SIZE

[SharedCode]
moduleMatches = 0xca6b9a52, 0x7467d6cf

.origin = codecave

; Init hook
; We initialize the semaphore we append at the end of the class
_TaskManagerInitHook:
  mflr r30
  li r4, 0 ; initial count for semaphore
  mr r3, r31
  addi r3, r3, TASK_MGR_OBJ_SIZE
  bl import.coreinit.OSInitSemaphore ; OSInitSemaphore(&taskMgr->ourSemaphore, 0)
  mtlr r30
  li r9, 0 ; our hook replaces an instruction that sets r9 = 0
blr


; Submit hook
; We signal the semaphore
_TaskManagerSubmitHook:
  mflr r29
  mr r3, r31
  addi r3, r3, TASK_MGR_OBJ_SIZE
  bl import.coreinit.OSSignalSemaphore ; OSSignalSemaphore(&taskMgr->ourSemaphore)
  mtlr r29
  lwz r3, 0x10(r1) ; replaced instruction
blr

; RunQueuedTask hook
; We wait for the semaphore before checking if work is available
_TaskManagerRunQueuedTask:
  mr r31, r3 ; replaced instruction

  mflr r29
  mr r3, r31
  addi r3, r3, TASK_MGR_OBJ_SIZE
  bl import.coreinit.OSWaitSemaphore ; OSWaitSemaphore(&taskMgr->ourSemaphore)
  
  mtlr r29
blr


; Todo - Signal semaphore on TaskManager shutdown request


[ColorSplashEUv0]
moduleMatches = 0xca6b9a52

; increase allocated size of sys::task::Manager to fit our appended OSSemaphore
0x025E249C = li r3, NEW_TASK_MGR_OBJ_SIZE
0x0233D068 = li r3, NEW_TASK_MGR_OBJ_SIZE
0x0233D098 = li r3, NEW_TASK_MGR_OBJ_SIZE
0x0243C284 = li r3, NEW_TASK_MGR_OBJ_SIZE

0x025E2588 = bla _TaskManagerInitHook
0x025E2AA8 = bla _TaskManagerSubmitHook
0x025E1F14 = bla _TaskManagerRunQueuedTask


[ColorSplashUSv0]
moduleMatches = 0x7467d6cf

; subtract 0xDC from EU offsets to get US offsets

0x025E23C0 = li r3, NEW_TASK_MGR_OBJ_SIZE
0x0233CF8C = li r3, NEW_TASK_MGR_OBJ_SIZE
0x0233CFBC = li r3, NEW_TASK_MGR_OBJ_SIZE
0x0243C1A8 = li r3, NEW_TASK_MGR_OBJ_SIZE

0x025E24AC = bla _TaskManagerInitHook
0x025E29CC = bla _TaskManagerSubmitHook
0x025E1E38 = bla _TaskManagerRunQueuedTask