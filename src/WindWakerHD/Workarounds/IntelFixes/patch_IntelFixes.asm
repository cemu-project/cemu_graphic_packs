[WindWakerHD_IntelFix_EU] ;made by BenjaminLSR
moduleMatches = 0xB7E748DE ; (EU)
_emptyString = 0x10166948
;is_useSsaoDirectDraw
0x0278EED8 = lis r0, _emptyString@ha
0x0278EEE4 = addic r0, r0, _emptyString@l

[WindWakerHD_IntelFix_NA] ;ported to US by M&M
moduleMatches = 0x475BD29F ; (NA)
_emptyString = 0x1016693C
;is_useSsaoDirectDraw
0x0278E618 = lis r0, _emptyString@ha
0x0278E624 = addic r0, r0, _emptyString@l

[WindWakerHD_IntelFix_JP] ;ported to JP by Crementif
moduleMatches = 0x74BD3F6A ; (JP)
_emptyString = 0x1016695C
;is_useSsaoDirectDraw
0x0278F0F8 = lis r0, _emptyString@ha
0x0278F104 = addic r0, r0, _emptyString@l
