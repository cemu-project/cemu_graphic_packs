[HyruleWarriors_60FPSFix_v208]
moduleMatches = 0xE159AE91 ; v208(EU/NA/JP)
; Change SetBaseFramePerSec(2) calls to SetBaseFramePerSec(1), fixes UI being too fast and allows ingame to go beyond 30FPS
; (SetBaseFramePerSec divides the number 60 by the parameter to get the target framerate, so 2 = 30FPS, 1 = 60FPS)
0x0219D7B0 = li r3, 1 ; Main::init
0x02438340 = li r3, 1 ; CDemoEventManager::TermRead()
0x02438864 = li r3, 1 ; CDemoEventManager::ChangeFPS()

; Set swap interval to 1 (needed since cemu 1.15.7)
0x02831FB4 = li r4, 1
0x02833B00 = nop ;nopesync

;0x100995A8 = .float 200.0

[HyruleWarriors_60FPSFix_EUv0]
moduleMatches = 0xDE6FF9D3 ; v0(EU/NA)
0x02186AB4 = li r3, 1 ; Main::init
0x023F9F54 = li r3, 1 ; CDemoEventManager::TermRead()
0x023FA3E4 = li r3, 1 ; CDemoEventManager::ChangeFPS()

0x027894F8 = li r4, 1
0x0278B0C8 = nop ;nopesync

[HyruleWarriors_60FPSFix_JPv16]
moduleMatches = 0xF290AEA8 ; v16(JP)
;.origin = codecave

;_fps:
;.float 120.0

;_fps60:
;lis r12, _fps@h
;stfs f0, _fps@l(r12)
;blr


;0x0221AB14 = bla _fps60
;0x0221AB1C = nop ;setFramePerSec
;0x0221AB7C = nop
;0x0221AB80 = bla _fps60

0x02788D24 = li r4, 1
;0x02788570 = li r3, 1 ;
0x0278A8F4 = nop ; Uncomment to kill vsync

0x02186A2C = li r3, 1 ; Main::init
0x023F9BEC = li r3, 1 ;;;
0x023FA07C = li r3, 1 ;;;

;0x021BA474 = li r3, 1 ;Mr, CViewModuleDefeat::lave Unstable
 ;;; 0x021C4148 = li r3, 1 ;Mr, CViewModuleMgr::Term
 ;;; 0x021C6D88 = li r3, 1 ;Mr, CViewModuleMotionLave
;0x0221AB18 = li r3, 1 ;mr, CViewModuleDefeat infunction

;0x023FA0D4 = li r3, 1 ; lvzCDemoEventManager switch to gameplay not neede with cor main?
;0x023F9BEC = li r3, 1 ; CDemoEventManager::TermRead()
;0x023FA07C = li r3, 1 ; CDemoEventManager::ChangeFPS()

