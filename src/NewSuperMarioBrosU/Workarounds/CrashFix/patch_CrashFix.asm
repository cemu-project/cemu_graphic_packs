[NSMBU+LU_CrashFix_V0]
moduleMatches = 0x1049CED8, 0x777D7B44

; remove check for mii data
0x024D7394 = b .+0xE8

[NSMBU_CrashFix_V64USV80EU]
moduleMatches = 0x6CAEA914, 0xFA29C89F

0x024D71C4 = b .+0xE8

[NSMBU_CrashFix_V0USV0EU]
moduleMatches = 0xA7A5ECF1, 0xC7B938AD

0x024BDE70 = b .+0xE8

[NSLU_CrashFix_V0EUv0US]
moduleMatches = 0xA3705C0B, 0xE71A8748

0x024D7158 = b .+0xE8

; Note: for future versions take the crash log and get the module checksum from the user. Subtract 0x7c from the link register in the crash log to be the address we patch.
