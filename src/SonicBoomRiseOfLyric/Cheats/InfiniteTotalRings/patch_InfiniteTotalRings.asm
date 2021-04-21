[WiiULauncher0US]
moduleMatches = 0x90DAC5CE

; Skip verification checks for total rings in BRBUIVars::verify_preorders
0x329DAE8 = nop
0x329DAF4 = nop
0x329DB24 = nop
0x329DB30 = nop

; Load 999999 into register 5 for all BRBRingBank::Set_GlobalRings and BRBRingBank::Add_GlobalRings instances
0x32863E8 = stw r5, 0xC(r31)
0x329A9F0 = stw r5, 0xC(r31)
0x334654C = stw r5, 0xC(r31)
0x334C638 = stw r5, 0xC(r31)
0x3466BB4 = stw r5, 0xC(r31)
0x3475FA0 = stw r5, 0xC(r31)
0x347DE04 = stw r5, 0xC(r31)

[WiiULauncher0EU]
moduleMatches = 0x8F7D2702

; Skip verification checks for total rings in BRBUIVars::verify_preorders
0x329DB80 = nop
0x329DB8C = nop
0x329DBBC = nop
0x329DBC8 = nop

; Load 999999 into register 5 for all BRBRingBank::Set_GlobalRings and BRBRingBank::Add_GlobalRings instances
0x3286480 = stw r5, 0xC(r31)
0x329AA88 = stw r5, 0xC(r31)
0x33465E4 = stw r5, 0xC(r31)
0x334C6D0 = stw r5, 0xC(r31)
0x3466C4C = stw r5, 0xC(r31)
0x3476038 = stw r5, 0xC(r31)
0x347DE9C = stw r5, 0xC(r31)

[WiiULauncher0JP]
moduleMatches = 0x0D395735

; Skip verification checks for total rings in BRBUIVars::verify_preorders
0x329DE70 = nop
0x329DE7C = nop
0x329DEAC = nop
0x329DEB8 = nop

; Load 999999 into register 5 for all BRBRingBank::Set_GlobalRings and BRBRingBank::Add_GlobalRings instances
0x3286724 = stw r5, 0xC(r31)
0x329AD4C = stw r5, 0xC(r31)
0x33468E4 = stw r5, 0xC(r31)
0x334C9D0 = stw r5, 0xC(r31)
0x3466F88 = stw r5, 0xC(r31)
0x34763B0 = stw r5, 0xC(r31)
0x347E214 = stw r5, 0xC(r31)

[WiiULauncher16]
moduleMatches = 0x113CC316

; Skip verification checks for total rings in BRBUIVars::verify_preorders
0x329DF38 = nop
0x329DF44 = nop
0x329DF74 = nop
0x329DF80 = nop

; Load 999999 into register 5 for all BRBRingBank::Set_GlobalRings and BRBRingBank::Add_GlobalRings instances
0x3286818 = stw r5, 0xC(r31)
0x329AE40 = stw r5, 0xC(r31)
0x33469B0 = stw r5, 0xC(r31)
0x334CA9C = stw r5, 0xC(r31)
0x3467018 = stw r5, 0xC(r31)
0x3476404 = stw r5, 0xC(r31)
0x347E268 = stw r5, 0xC(r31)