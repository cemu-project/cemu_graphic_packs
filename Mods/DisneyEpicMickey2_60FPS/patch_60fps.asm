[DEM260FPSVer0]
moduleMatches = 0x7d954baf

0x023239e8 = li r3,0 # Sets the swap interval to 0, disabling V-Sync

0x1013607c = .float 60.0 # fixes knockback (?)
0x1017de14 = .float 60.0 # some physics bs
0x101cc788 = .float 60.0 # another knockback value

0x101efcd4 = .float 60.0 # something to do with rendering
0x1020a7c8 = .float 60.0 # called by GetCurrentSceneFrame

0x102a2524 = .float 60.0 # actually set max frame rate
0x100758c8 = .float 60.0

0x0333ecdc = li r6,60
0x103230fc = .int 60
0x103208d0 = .float 0.016666667

0x10079d88 = .float 60.0
0x101d8baa = .float 60.0
0x10233600 = .float 60.0
