[Bayonetta2_DynamicShadows]
moduleMatches = 0xAF5D1A85 ; (EU/NA/JP)
0x02CCBD18 = fmr f12, f31 ; Always return a large value for the approximated maximum depth of the depth buffer. This value is used to calculate the projection size of the shadow map.

[Bayonetta2_DynamicShadows_vDemo]
moduleMatches = 0xCCB72156 ; demo(EU/NA)
0x02CB1680 = fmr f12, f31
