[DrawDistance_v208]
moduleMatches = 0xE159AE91
.origin = codecave 
##object clip
#0x100DD068 = .float 1.5 #0.5 
0x100DD06C = .float 1.5 #3.0 
#0x025F0554 = nop #same as setting 	0x100DD06C to 0. Fix this when instruction supported.
#0x025F02F4 = nop #
#stage clip 
0x100DFEC4 = .float 3.0 
0x100DFEC8 = .float 3.0 
##stage object lod
0x100DFDB8 = .float 3.0 
0x100DFDBC = .float 3.0 
0x100DFDD4 = .float 3.0 
0x100DFDD8 = .float 3.0 
0x100DFDFC = .float 3.0 
#fov 
#0x10006FD0 = .float 0.015 #fov   .float 0.017453292      # DATA XREF: CActFunc::GetViewParameter((PLAYER_ID,S_VIEW_PARAM &,uint))+194o
#  scatter light (fog)
#0x1001CA64 = .float 2.5 #  2.0 default, 4.0 dark   
#NPC text lod
#0x1009E134 = .float -8.0 #flt_1009E134:   .float -1.0             # DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void))+4Co
#0x1009E138 = .float 0.0 #flt_1009E138:   .float 0.0              # DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void)):loc_22BF3FCo
##dist from link
#0x100962BC = .float 0.25 #flt_100962BC:   .float 0.0

