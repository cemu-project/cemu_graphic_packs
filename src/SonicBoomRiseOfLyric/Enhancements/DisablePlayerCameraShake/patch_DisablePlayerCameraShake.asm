[SonicBoom_PlayerCameraShake_v16]
moduleMatches = 0x113CC316 ; v16(EU/NA)
; Skip shake initialisation in CBrbGameCamera::InitializeCameraShakes
0x0309CC28 = b 0x0309CE08

[SonicBoom_PlayerCameraShake_JP]
moduleMatches = 0x0D395735 ; (JP)
0x0309CA28 = b 0x0309CC08

[SonicBoom_PlayerCameraShake_EUv0]
moduleMatches = 0x8F7D2702 ; v0(EU)
0x0309CA70 = b 0x0309CC50

[SonicBoom_PlayerCameraShake_NAv0]
moduleMatches = 0x90DAC5CE ; v0(NA)
0x0309CA08 = b 0x0309CBE8

[SonicBoom_PlayerCameraShake_vDemo]
moduleMatches = 0xF8B127C5 ; demo(EU/NA)
0x0309c8e4 = b 0x0309cac4

[SonicBoom_PlayerCameraShake_JPvDemo]
moduleMatches = 0x62EBE136 ; demo(JP)
0x0309c908 = b 0x0309cae8
