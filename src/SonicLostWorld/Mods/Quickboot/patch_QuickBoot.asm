[SonicLostWolrd_QuickBoot_v48]
moduleMatches = 0xC5691A40 ; v48(EU/NA/JP)
;; Game States
;_staffRollAddr = 0x101B2110
;_worldMapAddr = 0x101B2120
;_stageAddr = 0x101B2128
;_E3Addr = 0x101B2150
_saveInitAddr = 0x101B2168
;_titleAddr = 0x101B2178
;_multiAddr = 0x101B2188
;_miniGameAddr = 0x101B2198
;_battleAddr = 0x101B21A0
;_gameOverAddr = 0x101B21A8
;_kioskAddr = 0x101B2280

; MANDATORY
0x02A83AAC = lwz r7, (_saveInitAddr - 0x101B213C)(r12) ; Boot now goes to SaveInit

; Change the Addr mentioned here to any of the game states from the rules.txt
0x02A83EF8 = lwz r6, ($bootaddr - 0x101B2174)(r11) ; SaveInit now goes to whatever is chosen

; Change the string to go to any stage upon boot (if Stage Boot is selected)
; List of stages are in stagelist.txt
;0x101B2378 = .string "w1a01"
0x101B2378 = .int $levelstring1
0x101B237C = .int $levelstring2
0x101B237F = .byte 0


[SonicLostWolrd_QuickBoot_v0]
moduleMatches = 0x7FE07429 ; v0(EU/NA/JP)
;; Game States
;_staffRollAddr = 0x10199568
;_worldMapAddr = 0x10199578
;_stageAddr = 0x10199580
;_E3Addr = 0x101995A0
_saveInitAddr = 0x101995B8
;_titleAddr = 0x101995C8
;_multiAddr = 0x101995D8
;_miniGameAddr = 0x101995E8
;_battleAddr = 0x101995F0
;_gameOverAddr = 0x101995F8

0x029EB51C = lwz r7, (_saveInitAddr - 0x10199594)(r12) ; Boot now goes to SaveInit

0x029EB968 = lwz r6, ($bootaddr - 0x101995C4)(r11) ; SaveInit now goes to whatever is chosen

0x1019976C = .int $levelstring1
0x10199770 = .int $levelstring2
0x10199773 = .byte 0


[SonicLostWolrd_QuickBoot_vDemo]
moduleMatches = 0xCA1DA800 ; demo(EU/NA/JP)
;; Game States
;_staffRollAddr = 0x1018FD1C
;_worldMapAddr = 0x1018FD2C
;_stageAddr = 0x1018FD34
_saveInitAddr = 0x1018FD5C
;_titleAddr = 0x1018FD6C
;_multiAddr = 0x1018FD74
;_miniGameAddr = 0x1018FD7C
;_battleAddr = 0x1018FD84
;_gameOverAddr = 0x1018FD8C

0x0297C364 = lwz r7, (_saveInitAddr - 0x1018FD48)(r12) ; Boot now goes to SaveInit

0x0297C5D4 = lwz r6, ($bootaddr - 0x1018FD58)(r11) ; SaveInit now goes to whatever is chosen

0x1018fE4C = .int $levelstring1
0x1018fE50 = .int $levelstring2
0x1018fE53 = .byte 0
