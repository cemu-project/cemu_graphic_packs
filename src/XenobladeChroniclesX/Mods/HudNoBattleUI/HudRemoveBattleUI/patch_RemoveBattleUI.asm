[XCX_RemoveBattleUI_v101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
;MISSING: enemy health bar animation, battle menu
;no enemy health bar, no player health bar (can only apply on boot)
;ideally each UI element should be seperated into its own pack
0x02c136bc = nop ;init enemy menu target status
0x02c1484c = nop ;init target menu target status
0x02c136e4 = nop ;init npc menu target status
0x02c6abc0 = nop ;init target cursor menu task
0x02c6aba8 = nop ;init target status menu task
0x02c6ab98 = nop ;init pc status
0x02c6b248 = nop ;close arts pallet
0x02c773b0 = nop ;disp status all
0x02bbebe0 = blr ;init menu pc status

[XCX_RemoveBattleUI_v102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02c136ac = nop ;init enemy menu target status
0x02c1483c = nop ;init target menu target status
0x02c136d4 = nop ;init npc menu target status
0x02c6ab60 = nop ;init target cursor menu task
0x02c6ab48 = nop ;init target status menu task
0x02c6ab38 = nop ;init pc status
0x02c6b1e8 = nop ;close arts pallet
0x02c77350 = nop ;disp status all
0x02bbebd0 = blr ;init menu pc status
