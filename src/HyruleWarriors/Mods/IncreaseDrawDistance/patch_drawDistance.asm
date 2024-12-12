[HyruleWarriors_DrawDistance_v208]
moduleMatches = 0xE159AE91 ; v208(EU/NA/JP)
; Object clip
0x100DD06C = .float 2.5 ;3.0
;0x025F0554 = nop ;same as setting 0x100DD06C to 0. ;Fix this when instruction supported.
;0x025F02F4 = nop
; Stage clip
0x100DFEC4 = .float 6.0 
;0x100DFEC8 = .float 6.0
; Stage clip update
0x100DFECC = .float 6.0
0x100DFED8 = .float 6.0 ;is a .double
0x100DFEDC = .float 6.0
0x100DFEE0 = .float 6.0

0x100FF060 = .float 0.99 ; Force high mip, texture LOD
0x100DD8C4 = .float 9900.0 ; Some smoke, particles

; Shadow draw distance (more like boundary)
0x10000B20 = .float 8500.0
0x10000B24 = .float 40000.0
0x100DFF78 = .float 40000.0   ;Dyamic object shadows like rocks, chests etc

; Grass and debris. Mitigates object pop as groups switches between LODs.
0x100DFF50 = .float 20000.0 
0x100DFF54 = .float 40000.0 
0x100DFF58 = .float 150000.0
0x100DFF5C = .float 200000.0
0x100DFF60 = .float 300000.0
0x100DFF64 = .float 500000.0
0x100DFF68 = .float 800000.0
0x100DFF6C = .float 80000.0 

; Replace army mid LOD with high LOD
;0x022BD744 =  li r12, 0
; FOV
;0x10006FD0 = .float 0.015 ;fov  .float 0.017453292   ; DATA XREF: CActFunc::GetViewParameter((PLAYER_ID,S_VIEW_PARAM &,uint))+194o
; Scatter light (fog)
;0x1001CA64 = .float 2.5 ; 2.0 default, 4.0 dark
; NPC text LOD
;0x1009E134 = .float -8.0 ;flt_1009E134:  .float -1.0     ; DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void))+4Co
;0x1009E138 = .float 0.0 ;flt_1009E138:  .float 0.0       ; DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void)):loc_22BF3FCo
; Distance from link
;0x100962BC = .float 0.25 ;flt_100962BC:  .float 0.0

[HyruleWarriors_DrawDistance_EUv0]
moduleMatches = 0xDE6FF9D3 ; v0(EU/NA)
; Object clip
0x100BBEB4 = .float 2.5 ;3.0
;0x025758E0 = nop ;same as setting 0x100BBEB4 to 0. ;Fix this when instruction supported.
;0x02575680 = nop
; Stage clip
0x100BED0C = .float 6.0
;0x100BED10 = .float 6.0
; Stage clip update
0x100BED14 = .float 6.0
0x100BED20 = .float 6.0 ;is a .double
0x100BED24 = .float 6.0
0x100BED28 = .float 6.0

0x100DE660 = .float 0.99 ; Force high mip, texture LOD
0x100BC70C = .float 9900.0 ; Some smoke, particles

; Shadow draw distance (more like boundary)
0x10000B20 = .float 8500.0
0x10000B24 = .float 40000.0
0x100bedc0 = .float 40000.0   ;Dyamic object shadows like rocks, chests etc

; Grass and debris.  Mitigates object pop as groups switches between lods.
0x100BED98 = .float 20000.0
0x100BED9C = .float 40000.0
0x100BEDA0 = .float 150000.0
0x100BEDA4 = .float 200000.0
0x100BEDA8 = .float 300000.0
0x100BEDAC = .float 500000.0
0x100BEDB0 = .float 800000.0
0x100BEDB4 = .float 80000.0

; Replace army mid LOD with high LOD
;0x02298098 =  li r12, 0
; FOV
;0x10006DA8 = .float 0.015 ;fov  .float 0.017453292   ; DATA XREF: CActFunc::GetViewParameter((PLAYER_ID,S_VIEW_PARAM &,uint))+194o
; Scatter light (fog)
;0x1001C0D4 = .float 2.5 ; 2.0 default, 4.0 dark
; NPC text LOD
;0x100884FC = .float -8.0 ;flt_100884FC:  .float -1.0     ; DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void))+4Co
;0x10088500 = .float 0.0 ;flt_10088500:  .float 0.0       ; DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void)):loc_22BF3FCo
; Distance from link
;0x10080ABC = .float 0.25 :flt_10080ABC:  .float 0.0

[HyruleWarriors_DrawDistance_EUv0_JPv16]
moduleMatches = 0xF290AEA8 ; v16(JP)
; Object clip
0x100BBE84 = .float 2.5 ;3.0
;0x0257510C = nop ;same as setting 0x100BBE84 to 0. ;Fix this when instruction supported.
;0x02574EAC = nop
; Stage clip
0x100BECDC = .float 6.0
;0x100BECE0 = .float 6.0
; Stage clip update
0x100BECE4 = .float 6.0
0x100BECE8 = .float 6.0 ;is a .double
0x100BECEC = .float 6.0
0x100BECF0 = .float 6.0

0x100DE630 = .float 0.99 ; Force high mip, texture LOD
0x100BC6DC = .float 9900.0 ; Some smoke, particles

; Shadow draw distance (more like boundary)
0x10000B20 = .float 8500.0
0x10000B24 = .float 40000.0
0x100bed90 = .float 40000.0   ;Dyamic object shadows like rocks, chests etc

; Grass and debris.  Mitigates object pop as groups switches between lods.
0x100BED68 = .float 20000.0
0x100BED6C = .float 40000.0
0x100BED70 = .float 150000.0
0x100BED74 = .float 200000.0
0x100BED78 = .float 300000.0
0x100BED7C = .float 500000.0
0x100BED80 = .float 800000.0
0x100BED84 = .float 80000.0

; Replace army mid LOD with high LOD
;0x02297E94 =  li r12, 0
; FOV
;0x10006DA8 = .float 0.015 ;fov  .float 0.017453292   ; DATA XREF: CActFunc::GetViewParameter((PLAYER_ID,S_VIEW_PARAM &,uint))+194o
; Scatter light (fog)
;0x1001C0D4 = .float 2.5 ; 2.0 default, 4.0 dark
; NPC text LOD
;0x100884FC = .float -8.0 ;flt_100884FC:  .float -1.0     ; DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void))+4Co
;0x10088500 = .float 0.0 ;flt_10088500:  .float 0.0       ; DATA XREF: CActModuleModelCommon::fGetMipLodBias(const(void)):loc_22BF3FCo
; Distance from link
;0x10080ABC = .float 0.25 :flt_10080ABC:  .float 0.0
