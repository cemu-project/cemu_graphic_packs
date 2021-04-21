[WiiULauncher0US]
moduleMatches = 0x90DAC5CE

; Skip verification checks for robot scrap in BRBUIVars::verify_preorders
0x329DB7C = nop
0x329DB88 = nop
0x329DBB8 = nop
0x329DBC4 = nop

; Skip argument check before executing BRBRingBank::Set_RobotParts in the upgrade manager
0x308285C = nop

; Load 999999 into register 5 for all BRBRingBank::Set_RobotParts and BRBRingBank::Add_RobotParts instances
0x30825D0 = stw r5, 0x10(r31)
0x3285C5C = stw r5, 0x10(r31)
0x329AA6C = stw r5, 0x10(r31)
0x3466C3C = stw r5, 0x10(r31)
0x34B451C = stw r5, 0x10(r31)
0x34B76FC = stw r5, 0x10(r31)

[WiiULauncher0EU]
moduleMatches = 0x8F7D2702

; Skip verification checks for robot scrap in BRBUIVars::verify_preorders
0x329DC14 = nop
0x329DC20 = nop
0x329DC50 = nop
0x329DC5C = nop

; Skip argument check before executing BRBRingBank::Set_RobotParts in the upgrade manager
0x30828B4 = nop

; Load 999999 into register 5 for all BRBRingBank::Set_RobotParts and BRBRingBank::Add_RobotParts instances
0x3082628 = stw r5, 0x10(r31)
0x3285CF4 = stw r5, 0x10(r31)
0x329AB04 = stw r5, 0x10(r31)
0x3466CD4 = stw r5, 0x10(r31)
0x34B45B4 = stw r5, 0x10(r31)
0x34B7794 = stw r5, 0x10(r31)

[WiiULauncher0JP]
moduleMatches = 0x0D395735

; Skip verification checks for robot scrap in BRBUIVars::verify_preorders
0x329DF04 = nop
0x329DF10 = nop
0x329DF40 = nop
0x329DF4C = nop

; Skip argument check before executing BRBRingBank::Set_RobotParts in the upgrade manager
0x3082858 = nop

; Load 999999 into register 5 for all BRBRingBank::Set_RobotParts and BRBRingBank::Add_RobotParts instances
0x30825CC = stw r5, 0x10(r31)
0x3285F98 = stw r5, 0x10(r31)
0x329ADC8 = stw r5, 0x10(r31)
0x3467010 = stw r5, 0x10(r31)
0x34B48F4 = stw r5, 0x10(r31)
0x34B7AD4 = stw r5, 0x10(r31)

[WiiULauncher16]
moduleMatches = 0x113CC316

; Skip verification checks for robot scrap in BRBUIVars::verify_preorders
0x329DFCC = nop
0x329DFD8 = nop
0x329E008 = nop
0x329E014 = nop

; Skip argument check before executing BRBRingBank::Set_RobotParts in the upgrade manager
0x3082A7C = nop

; Load 999999 into register 5 for all BRBRingBank::Set_RobotParts instances
0x30827F0 = stw r5, 0x10(r31)
0x328608C = stw r5, 0x10(r31)
0x329AEBC = stw r5, 0x10(r31)
0x34670A0 = stw r5, 0x10(r31)
0x34B496C = stw r5, 0x10(r31)
0x34B7B4C = stw r5, 0x10(r31)