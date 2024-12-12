[SonicBoom_UnlockMoneyBags_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Jump to success condition
0x034BD898 = b 0x034BD9E4
; Force loop to iterate four times to unlock all bonuses
0x034BDA04 = li r27, 4
; Branch back to first condition to unlock the UI
0x034BDA6C = b 0x034BD9BC
; Skip saving callback in 3DS response payload
0x034C0184 = nop

[SonicBoom_UnlockMoneyBags_JP]
moduleMatches = 0x0D395735 ; (JP)
0x034BD7DC = b 0x034BD928
0x034BD948 = li r27, 4
0x034BD9B0 = b 0x034BD900
0x034C0128 = nop

[SonicBoom_UnlockMoneyBags_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x034BD480 = b 0x034BD5CC
0x034BD5EC = li r27, 4
0x034BD654 = b 0x034BD5A4
0x034BFD6C = nop

[SonicBoom_UnlockMoneyBags_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x034BD3E4 = b 0x034BD524
0x034BD544 = li r27, 4
0x034BD5AC = b 0x034BD4FC
0x034BFCB8 = nop

[SonicBoom_UnlockMoneyBags_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
0x034bd4ec = b 0x034bd638
0x034bd658 = li r27, 4
0x034bd6c0 = b 0x034bd610
0x034bfe30 = nop

[SonicBoom_UnlockMoneyBags_JPvDemo]
moduleMatches = 0x62EBE136 ; demo(JP)
0x034bd6bc = b 0x034bd808
0x034bd828 = li r27, 4
0x034bd890 = b 0x034bd7e0
0x034c0008 = nop
