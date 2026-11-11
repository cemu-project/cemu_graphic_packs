[Bayonetta_CinematicsFix_US_V1]
moduleMatches = 0xA5D97255 # BayonetLoader.rpx, US v1
; Fixes FMV cutscenes (and the opening movie) that stay on a white screen.
; Cause: CRI Mana registers its sound-server callback with CRI Atom only if Atom is already
; initialized (BayonetWU 0x02DCC0D0 -> 0x02D2C08C / 0x02D2C2BC) and never retries. If Mana
; initializes first, movie audio is never fed and Mana's audio-driven clock stays at 0.
; Fix: whenever the game creates a movie player (BayonetWU 0x02CA5AA4), if Atom is initialized,
; call 0x02D2C2BC(0x02DCBD80, 0) - the same registration Mana would have done.
; BayonetWU.rpl is loaded after patches are applied, so the hook is installed from BayonetLoader
; right before it calls into BayonetWU (rpl_main at 0x022F8578), using the runtime load offset.
.origin = codecave
_loadOffset:
.int 0

_onMoviePlayerCreate:
stwu r1, -0x30(r1)
stw r3, 0x10(r1)
stw r4, 0x14(r1)
stw r5, 0x18(r1)
stw r6, 0x1C(r1)
stw r7, 0x20(r1)
mflr r0
stw r0, 0x34(r1)
lis r11, _loadOffset@ha
lwz r11, _loadOffset@l(r11)
lis r12, 0x02D2
ori r12, r12, 0xC08C
add r12, r12, r11
mtctr r12
bctrl
cmpwi r3, 1
bne _onMoviePlayerCreate_end
lis r11, _loadOffset@ha
lwz r11, _loadOffset@l(r11)
lis r3, 0x02DC
ori r3, r3, 0xBD80
add r3, r3, r11
li r4, 0
lis r12, 0x02D2
ori r12, r12, 0xC2BC
add r12, r12, r11
mtctr r12
bctrl
_onMoviePlayerCreate_end:
lwz r0, 0x34(r1)
mtlr r0
lwz r3, 0x10(r1)
lwz r4, 0x14(r1)
lwz r5, 0x18(r1)
lwz r6, 0x1C(r1)
lwz r7, 0x20(r1)
addi r1, r1, 0x30
mflr r0
_onMoviePlayerCreate_jmp:
nop

_installHook:
lwz r12, 0xC(r1)
lis r11, 0x022F
ori r11, r11, 0x8578
subf r12, r11, r12
lis r11, _loadOffset@ha
stw r12, _loadOffset@l(r11)
lis r11, 0x02CA
ori r11, r11, 0x5AA4
add r11, r11, r12
lis r9, _onMoviePlayerCreate@ha
addi r9, r9, _onMoviePlayerCreate@l
subf r9, r11, r9
rlwinm r9, r9, 0, 6, 29
oris r9, r9, 0x4800
stw r9, 0(r11)
addi r11, r11, 4
lis r10, _onMoviePlayerCreate_jmp@ha
addi r10, r10, _onMoviePlayerCreate_jmp@l
subf r9, r10, r11
rlwinm r9, r9, 0, 6, 29
oris r9, r9, 0x4800
stw r9, 0(r10)
lwz r12, 0xC(r1)
blr

0x0200012C = bla _installHook
