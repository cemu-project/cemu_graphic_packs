[SonicBoom_InfiniteTotalRings_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip verification checks for total rings in BRBUIVars::verify_preorders
0x0329DF38 = nop
0x0329DF44 = nop
0x0329DF74 = nop
0x0329DF80 = nop
; Load 999999 into register 5 for all BRBRingBank::Set_GlobalRings and BRBRingBank::Add_GlobalRings instances
0x03286818 = stw r5, 0xC(r31)
0x0329AE40 = stw r5, 0xC(r31)
0x033469B0 = stw r5, 0xC(r31)
0x0334CA9C = stw r5, 0xC(r31)
0x03467018 = stw r5, 0xC(r31)
0x03476404 = stw r5, 0xC(r31)
0x0347E268 = stw r5, 0xC(r31)

[SonicBoom_InfiniteTotalRings_JP]
moduleMatches = 0x0D395735 ; (JP)
0x0329DE70 = nop
0x0329DE7C = nop
0x0329DEAC = nop
0x0329DEB8 = nop
0x03286724 = stw r5, 0xC(r31)
0x0329AD4C = stw r5, 0xC(r31)
0x033468E4 = stw r5, 0xC(r31)
0x0334C9D0 = stw r5, 0xC(r31)
0x03466F88 = stw r5, 0xC(r31)
0x034763B0 = stw r5, 0xC(r31)
0x0347E214 = stw r5, 0xC(r31)

[SonicBoom_InfiniteTotalRings_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x0329DB80 = nop
0x0329DB8C = nop
0x0329DBBC = nop
0x0329DBC8 = nop
0x03286480 = stw r5, 0xC(r31)
0x0329AA88 = stw r5, 0xC(r31)
0x033465E4 = stw r5, 0xC(r31)
0x0334C6D0 = stw r5, 0xC(r31)
0x03466C4C = stw r5, 0xC(r31)
0x03476038 = stw r5, 0xC(r31)
0x0347DE9C = stw r5, 0xC(r31)

[SonicBoom_InfiniteTotalRings_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x0329DAE8 = nop
0x0329DAF4 = nop
0x0329DB24 = nop
0x0329DB30 = nop
0x032863E8 = stw r5, 0xC(r31)
0x0329A9F0 = stw r5, 0xC(r31)
0x0334654C = stw r5, 0xC(r31)
0x0334C638 = stw r5, 0xC(r31)
0x03466BB4 = stw r5, 0xC(r31)
0x03475FA0 = stw r5, 0xC(r31)
0x0347DE04 = stw r5, 0xC(r31)

[SonicBoom_InfiniteTotalRings_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
0x0329db34 = nop
0x0329db40 = nop
0x0329db70 = nop
0x0329db7c = nop
0x032863e8 = stw r5, 0xC(r31)
0x0329aa10 = stw r5, 0xC(r31)
0x03346598 = stw r5, 0xC(r31)
0x0334c684 = stw r5, 0xC(r31)
0x03466c14 = stw r5, 0xC(r31)
0x03476030 = stw r5, 0xC(r31)
0x0347de94 = stw r5, 0xC(r31)

[SonicBoom_InfiniteTotalRings_JPvDemo]
moduleMatches = 0x62EBE136 ; demo(JP)
0x0329dd50 = nop
0x0329dd5c = nop
0x0329dd8c = nop
0x0329dd98 = nop
0x03286604 = stw r5, 0xC(r31)
0x0329ac2c = stw r5, 0xC(r31)
0x033467c4 = stw r5, 0xC(r31)
0x0334c8b0 = stw r5, 0xC(r31)
0x03466e68 = stw r5, 0xC(r31)
0x03476290 = stw r5, 0xC(r31)
0x0347e0f4 = stw r5, 0xC(r31)
