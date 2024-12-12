[SonicBoom_InfiniteRobotScrap_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip verification checks for robot scrap in BRBUIVars::verify_preorders
0x0329DFCC = nop
0x0329DFD8 = nop
0x0329E008 = nop
0x0329E014 = nop
; Skip argument check before executing BRBRingBank::Set_RobotParts in the upgrade manager
0x03082A7C = nop
; Load 999999 into register 5 for all BRBRingBank::Set_RobotParts instances
0x030827F0 = stw r5, 0x10(r31)
0x0328608C = stw r5, 0x10(r31)
0x0329AEBC = stw r5, 0x10(r31)
0x034670A0 = stw r5, 0x10(r31)
0x034B496C = stw r5, 0x10(r31)
0x034B7B4C = stw r5, 0x10(r31)

[SonicBoom_InfiniteRobotScrap_JP]
moduleMatches = 0x0D395735 ; (JP)
0x0329DF04 = nop
0x0329DF10 = nop
0x0329DF40 = nop
0x0329DF4C = nop
0x03082858 = nop
0x030825CC = stw r5, 0x10(r31)
0x03285F98 = stw r5, 0x10(r31)
0x0329ADC8 = stw r5, 0x10(r31)
0x03467010 = stw r5, 0x10(r31)
0x034B48F4 = stw r5, 0x10(r31)
0x034B7AD4 = stw r5, 0x10(r31)

[SonicBoom_InfiniteRobotScrap_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x0329DC14 = nop
0x0329DC20 = nop
0x0329DC50 = nop
0x0329DC5C = nop
0x030828B4 = nop
0x03082628 = stw r5, 0x10(r31)
0x03285CF4 = stw r5, 0x10(r31)
0x0329AB04 = stw r5, 0x10(r31)
0x03466CD4 = stw r5, 0x10(r31)
0x034B45B4 = stw r5, 0x10(r31)
0x034B7794 = stw r5, 0x10(r31)

[SonicBoom_InfiniteRobotScrap_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x0329DB7C = nop
0x0329DB88 = nop
0x0329DBB8 = nop
0x0329DBC4 = nop
0x0308285C = nop
0x030825D0 = stw r5, 0x10(r31)
0x03285C5C = stw r5, 0x10(r31)
0x0329AA6C = stw r5, 0x10(r31)
0x03466C3C = stw r5, 0x10(r31)
0x034B451C = stw r5, 0x10(r31)
0x034B76FC = stw r5, 0x10(r31)

[SonicBoom_InfiniteRobotScrap_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
0x0329dbc8 = nop
0x0329dbd4 = nop
0x0329dc04 = nop
0x0329dc10 = nop
0x03082720 = nop
0x03082494 = stw r5, 0x10(r31)
0x03285c5c = stw r5, 0x10(r31)
0x0329aa8c = stw r5, 0x10(r31)
0x03466c9c = stw r5, 0x10(r31)
0x034b45f8 = stw r5, 0x10(r31)
0x034b77d8 = stw r5, 0x10(r31)

[SonicBoom_InfiniteRobotScrap_JPvDemo]
moduleMatches =  0x62EBE136 ; demo(JP)
0x0329dde4 = nop
0x0329ddf0 = nop
0x0329de20 = nop
0x0329de2c = nop
0x03082738 = nop
0x030824ac = stw r5, 0x10(r31)
0x03285e78 = stw r5, 0x10(r31)
0x0329aca8 = stw r5, 0x10(r31)
0x03466ef0 = stw r5, 0x10(r31)
0x034b47d4 = stw r5, 0x10(r31)
0x034b79b4 = stw r5, 0x10(r31)
