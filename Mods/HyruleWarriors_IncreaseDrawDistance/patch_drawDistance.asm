[DrawDistance_v208]
moduleMatches = 0xE159AE91

.origin = codecave

# Object clip
0x100DD06C = .float 2.5
#0x025F0554 = nop # Same as setting 0x100DD06C to 0. Fix this when instruction supported.
#0x025F02F4 = nop

# Stage clip
0x100DFEC4 = .float 6.0
#0x100DFEC8 = .float 6.0

# Stage clip update
0x100DFECC = .float 6.0
0x100DFED8 = .float 6.0
0x100DFEDC = .float 6.0
0x100DFEE0 = .float 6.0

0x100FF060 = .float 0.99 # Force high mip, texture LOD
0x100DD8C4 = .float 9900.0 # Some smoke, particles

# Shadow draw distance (more like boundary)
0x10000B20  = .float 8500.0
0x10000B24  = .float 40000.0
0x100DFF78 = .float 40000.0 # Dynamic object shadows like rocks, chests etc.

# Grass and debris. Mitigates object pop as groups switches between lods.
0x100DFF50 = .float 20000.0
0x100DFF54 = .float 40000.0
0x100DFF58 = .float 150000.0
0x100DFF5C = .float 200000.0
0x100DFF60 = .float 300000.0
0x100DFF64 = .float 500000.0
0x100DFF68 = .float 800000.0
0x100DFF6C = .float 80000.0

# Replace army mid LOD with high LOD
#0x022BD744 =  li r12, 0

# FOV
#0x10006FD0 = .float 0.015

# Scatter light (fog)
#0x1001CA64 = .float 2.5 # 2.0 default, 4.0 dark

# NPC text LOD
#0x1009E134 = .float -8.0 # flt_1009E134: .float -1.0 # DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void))+4Co
#0x1009E138 = .float 0.0 # flt_1009E138: .float 0.0 # DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void)):loc_22BF3FCo

# Distance from Link
#0x100962BC = .float 0.25 # flt_100962BC: .float 0.0