;[NSMBU_NSLU_LiftAnything]
;moduleMatches = 0x777D7B44, 0x1049CED8, 0xFA29C89F, 0x6CAEA914, 0xE3E1464E, 0x0E2C7B3D, 0xC7B938AD, 0xA7A5ECF1, 0x84684DF7, 0xE71A8748, 0xA3705C0B ; NSMBU+NSLU v0(EU), v0(NA), NSMBU v80(EU), v64(NA), v65(JP), trial(JP),  NSMBU v0(EU), v0(NA), v0(JP), NSLU v0(EU), v0(NA)

[NSMBU_NSLU_LiftAnything_v0]
moduleMatches = 0x777D7B44, 0x1049CED8 ; NSMBU+NSLU v0(EU), v0(NA)
ActorMgr_instance = 0x101D0548
ActorMgr_GetActorByUniqueID = 0x0200A5C8

PlayerMgr_instance = 0x101EF9D4
GetPlayerCenterPos = 0x0290E2E8

IceBlockActor_GetCarryPos = 0x0236F52C
IceBlockActor_SetCarryPos = 0x0236F58C

OFFS_ACTOR_CARRIED = 0x221
OFFS_ACTOR_CARRY_COOLDOWN = 0x222
OFFS_ACTOR_PLAYER_ID = 0x54


ActorCtorTail:
    ; Set carried and carry cooldown to 0
    li      r0, 0;
    stb     r0, OFFS_ACTOR_CARRIED(r3);
    stb     r0, OFFS_ACTOR_CARRY_COOLDOWN(r3);
    blr

SetSpinLiftupActor:
    cmpwi   r0, 0;
    beq-    L_SetSpinLiftupActor_Emulate;

    ; Check for blr
    lwzx    r12, 0, r0; ; Because we have to read from r0 lol
    xoris   r12, r12, 0x4E80;
    cmplwi  r12, 0x0020;
    beq-    L_SetSpinLiftupActor_Emulate;

    ; Run original function
    bctrl;
    b       L_SetSpinLiftupActor_Out;

    L_SetSpinLiftupActor_Emulate:;
    ; Copy player ID
    lbz     r0, OFFS_ACTOR_PLAYER_ID(r4);
    stb     r0, OFFS_ACTOR_PLAYER_ID(r3);

    li      r0, 1;
    stb     r0, OFFS_ACTOR_CARRIED(r3);

    L_SetSpinLiftupActor_Out:
    ;blr





; Always allow carry
0x02949B58 = nop
; Set default carry values in Actor constructor
0x02000F14 = bla ActorCtorTail
; Override setSpinLiftupActor
0x029491D0 = ba SetSpinLiftupActor
