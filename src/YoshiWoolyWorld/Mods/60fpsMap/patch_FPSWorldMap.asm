[YoshiWoolyWorld_FPSWorldMap_v110]
moduleMatches = 0x6AEF65E7 ; v1.1.0(EU/NA/JP)
;prevent going to 30 fps mode
0x02B38D7C = b .+0x20

[YoshiWoolyWorld_FPSWorldMap_v100]
moduleMatches = 0x363CA665 ; v1.0.0(EU/NA/JP)
;prevent going to 30 fps mode
0x02B38940 = b .+0x20
