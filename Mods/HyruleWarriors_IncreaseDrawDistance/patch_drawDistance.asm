[DrawDistance_v208] 
moduleMatches = 0xE159AE91
.origin = codecave 

##object clip
0x100DD06C = .float 2.5 #3.0 
#0x025F0554 = nop #same as setting 	0x100DD06C to 0. Fix this when instruction supported.
#0x025F02F4 = nop #
#stage clip 
0x100DFEC4 = .float 6.0 
#0x100DFEC8 = .float 6.0 
##stage clip update
0x100DFECC = .float 6.0
0x100DFED8 = .float 6.0
0x100DFEDC = .float 6.0
0x100DFEE0 = .float 6.0

0x100FF060 = .float 0.99 # force high mip / texture lod
0x100DD8C4 = .float 9900.0 # some smoke / particles 

# shadow draw distance (more like boundary) 
0x10000B20  = .float 8500.0 
0x10000B24  = .float 40000.0 
0x100DFF78 = .float 40000.0   #Dyamic object shadows ie rocks, chests etc 

#Grass, debris.  Mitigates object pop as groups switces between lods. 
0x100DFF50 = .float 20000.0 
0x100DFF54 = .float 40000.0 
0x100DFF58 = .float 150000.0
0x100DFF5C = .float 200000.0
0x100DFF60 = .float 300000.0
0x100DFF64 = .float 500000.0
0x100DFF68 = .float 800000.0
0x100DFF6C = .float 80000.0 

#Replace army mid LOD with high LOD
#0x022BD744 =  li        r12, 0   
#fov 
#0x10006FD0 = .float 0.015 #fov  .float 0.017453292   # DATA XREF: CActFunc::GetViewParameter((PLAYER_ID,S_VIEW_PARAM &,uint))+194o
# scatter light (fog)
#0x1001CA64 = .float 2.5 # 2.0 default, 4.0 dark  
#NPC text lod
#0x1009E134 = .float -8.0 #flt_1009E134:  .float -1.0       # DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void))+4Co
#0x1009E138 = .float 0.0 #flt_1009E138:  .float 0.0       # DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void)):loc_22BF3FCo
##dist from link
#0x100962BC = .float 0.25 #flt_100962BC:  .float 0.0

