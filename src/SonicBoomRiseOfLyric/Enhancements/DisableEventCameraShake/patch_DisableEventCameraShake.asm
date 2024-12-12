[SonicBoom_EventCameraShake_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip shake initialisation in CView::ProcessShakeNormal
0x02AEA9A8 = b 0x02AEAA48

[SonicBoom_EventCameraShake_JP]
moduleMatches = 0x0D395735 ; (JP)
0x02AEA988 = b 0x02AEAA28

[SonicBoom_EventCameraShake_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x02AEA94C = b 0x02AEA9EC

[SonicBoom_EventCameraShake_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x02AEA96C = b 0x02AEAA0C

[SonicBoom_EventCameraShake_vDemo]
moduleMatches = 0xF8B127C5, 0x62EBE136 ; demo(EU/NA), demo(JP)
0x02aea968 = b 0x02aeaa08
