;[NSMBU_NSLU_CourseLoad]
;moduleMatches = 0x777D7B44, 0x1049CED8, 0xFA29C89F, 0x6CAEA914, 0xE3E1464E, 0x0E2C7B3D, 0xC7B938AD, 0xA7A5ECF1, 0x84684DF7, 0xE71A8748, 0xA3705C0B ; NSMBU+NSLU v0(EU), v0(NA), NSMBU v80(EU), v64(NA), v65(JP), trial(JP),  NSMBU v0(EU), v0(NA), v0(JP), NSLU v0(EU), v0(NA)


[NSMBU_NSLU_CourseLoad_v0]
moduleMatches = 0x777D7B44, 0x1049CED8 ; NSMBU+NSLU v0(EU), v0(NA)
.origin = codecave

WMThing_LoadLevel = 0x0223B820
CSSeqMgr = 0x101D9044
CSSeqMgr_addToQueue = 0x021E48E0

StartGameInfo = 0x101DED6C
FadeMgr = 0x101F577C
FadeMgr_FadeToLevelForSecret = 0x029B3B18
FadeMgr_FadeToLevel = 0x029B39F8
FadeMgr_StartFade = 0x029B398C

FadeThing = 0x101D9DEC
FadeThing_CallFade = 0x029A3620

ENTER_LEVEL_NORMAL = 0x1
ENTER_LEVEL_MORTON_CASTLE_SECRET = 0x26

CheckAndLoadLevel:
bl      L_CheckAndLoadLevel_Code
; Magic
long1:
.int 0x00000000
long2:
.int 0x00000000
long3:
.int 0x00000000

paddingArea:
.int 0x00000001 ; Valid {Padding} Area Entrance

longWorld:
.int   0 ; World
longLevel:
.int   1 ; Level

L_CheckAndLoadLevel_Code:
mflr    r31
; 09 86 54 45 24 2F B6 7F 21 31 DA 7C
; This is just so an external program can search and find the memory address
lis     r10, 0x0986
ori     r10, r10, 0x5445
stw     r10, 0(r31)
lis     r10, 0x242F
ori     r10, r10, 0xB67F
stw     r10, 4(r31)
lis     r10, 0x2131
ori     r10, r10, 0xDA7C
stw     r10, 8(r31)

; Check if valid
lbz     r0, 0xC(r31)
cmpwi   r0, 0
beq-    L_CheckAndLoadLevel_Out

li      r0, 0
stb     r0, 0xC(r31)

; Load level
or      r3, r30, r30
lwz     r4, 0x10(r31)
lwz     r5, 0x14(r31)

;BL_CALL(WMThing_LoadLevel)
lis     r12, WMThing_LoadLevel@h
ori     r12, r12, WMThing_LoadLevel@l
mtctr   r12
bctrl

; Start transition
;lis     r31, CSSeqMgr@ha
;lwz     r3, CSSeqMgr@l(r31)

;li      r0, 0x26
;stw     r0, 0x8(sp)
;stw     r0, 0xC(sp)

;addi    r4, r1, 0x8

;;BL_CALL(0x021E4D20)
;lis     r12, 0x021E
;ori     r12, r12, 0x4D20
;mtctr   r12
;bctrl

;li      r0, 0;
;stw     r0, 0x18(r1)
;stw     r3, 0x10(r1)
;stw     r0, 0x14(r1)
;addi    r4, r1, 0xC
;lwz     r3, CSSeqMgr@l(r31)

;;BL_CALL(CSSeqMgr_addToQueue)
;lis     r12, CSSeqMgr_addToQueue@h
;ori     r12, r12, CSSeqMgr_addToQueue@l
;mtctr   r12
;bctrl

;lis        r3, FadeMgr@ha
;lwz        r3, FadeMgr@l(r3)
;lis        r4, 0x101D
;lwz        r4, 0x9DEC(r4)
;lwz        r5, 0x10(r31)
;lwz        r6, 0x14(r31)
;li r5, 0
;li r6, 1

;BL_CALL(FadeMgr_FadeToLevel)
;lis     r12, FadeMgr_FadeToLevel@h
;ori     r12, r12, FadeMgr_FadeToLevel@l
;mtctr   r12
;bctrl

lis        r3, StartGameInfo@ha
lwz        r3, StartGameInfo@l(r3)


;lwz        r0, 0x10(r31)
li         r0, 0
stb        r0, 0x1C(r3)
;lwz        r0, 0x14(r31)
li         r0, 0
stb        r0, 0x1D(r3)

; Do Fade
lis        r3, FadeMgr@ha
lwz        r3, FadeMgr@l(r3)
lis        r4, FadeThing@ha
lwz        r4, FadeThing@l(r4)

li         r10, 2
lis        r9, 0x0202
ori        r9, r9, 0xB644
stw        r10, 0x8(r1)
stw        r9, 0xC(r1)

addi       r5, r1, 0x8
li         r6, 0
li         r7, 0

;BL_CALL(FadeMgr_StartFade)
lis     r12, FadeMgr_StartFade@h
ori     r12, r12, FadeMgr_StartFade@l
mtctr   r12
bctrl

cmpwi      r3, 0
beq-       L_CheckAndLoadLevel_Out

lis        r3, StartGameInfo@ha
lwz        r3, StartGameInfo@l(r3)

lbz        r0, 0xE(r31)
stb        r0, 0x1E(r3)
lbz        r0, 0xF(r31)
stb        r0, 0x1F(r3)

li         r0, 1
stw        r0, 0x20(r3)



L_CheckAndLoadLevel_Out:
lmw     r25, 0x24(r1) ; Original instruction
nop
;b 0x0220f854
lis     r12, 0x0220
ori     r12, r12, 0xf854
mtctr   r12
bctr

0x0220F850 = ba CheckAndLoadLevel

;b 0x02b6ff58
