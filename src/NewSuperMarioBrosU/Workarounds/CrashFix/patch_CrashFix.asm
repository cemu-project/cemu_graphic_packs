[NSMBU_NSLU_CrashFix_v0]
moduleMatches = 0x777D7B44, 0x1049CED8 ; NSMBU+NSLU v0(EU), v0(NA)
; remove check for mii data
0x024D7394 = b .+0xE8

[NSMBU_CrashFix_v80]
moduleMatches = 0xFA29C89F, 0x6CAEA914, 0xE3E1464E, 0x0E2C7B3D ; NSMBU v80(EU), v64(NA), v65(JP), trial(JP)
0x024D71C4 = b .+0xE8

[NSMBU_CrashFix_v0]
moduleMatches = 0xC7B938AD, 0xA7A5ECF1, 0x84684DF7 ; NSMBU v0(EU), v0(NA), v0(JP)
0x024BDE70 = b .+0xE8

[NSLU_CrashFix_v0]
moduleMatches = 0xE71A8748, 0xA3705C0B ; NSLU v0(EU), v0(NA)
0x024D7158 = b .+0xE8

; Note: for future versions take the crash log and get the module checksum from the user. Subtract 0x7c from the link register in the crash log to be the address we patch.
