[MarioKart8_CourseUnlock]
moduleMatches = 0x9F0A90B7, 0xD09700CE ; v4.2(EU/NA/JP), v4.1(EU/NA/JP)
.origin = codecave
UnlockCourses:
lis r30, 0x0303
ori r30, r30, 0x0303
stw r30, 0(r11)
stw r30, 4(r11)
lbzx r30, r11, r0
blr

[MarioKart8_CourseUnlock_v42]
moduleMatches = 0x9F0A90B7 ; v4.2(EU/NA/JP)
;this mod makes every byte at 0x2e6b6668 = 3
0x024D74CC = bla UnlockCourses

[MarioKart8_CourseUnlock_v41]
moduleMatches = 0xD09700CE ; v4.1(EU/NA/JP)
0x024D7148 = bla UnlockCourses
