[SonicBoom_UncapFPS_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Unconditionally branch DriverD3D::LimitFramerate immediately
0x02E47148 = blr

[SonicBoom_UncapFPS_JP]
moduleMatches = 0x0D395735 ; (JP)
0x02E46EAC = blr

[SonicBoom_UncapFPS_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x02E470F0 = blr

[SonicBoom_UncapFPS_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x02E47110 = blr

[SonicBoom_UncapFPS_vDemo]
moduleMatches = 0xF8B127C5, 0x62EBE136 ; demo(EU/NA), demo(JP)
0x02E46D8C = blr
