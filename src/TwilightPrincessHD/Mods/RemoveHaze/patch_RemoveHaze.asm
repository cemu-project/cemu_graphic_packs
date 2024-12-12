[TwilightPrincessHD_RemoveHaze]
moduleMatches = 0x1A03E108, 0xA3175EEA ; v81(EU/NA), v82(JP)
;##exp and haze settings
0x100C3EB8 = .float $nearExp   ; Near world (over)exposure
0x100C36C4 = .float $bloomExp  ; Bloom npc/object (over) "
0x100C3780 = .float $distExp   ; Distant world (over)exposure
;0x100C3774 = .float $distanceFog
0x1012C898 = .float  $distanceFog
;0x100871C8 = .float 0.01 ;100871C8:.float 0.00050000002   ;cloud float
