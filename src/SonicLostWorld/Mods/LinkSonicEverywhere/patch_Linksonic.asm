[sonic2013_v48]
moduleMatches = 0xC5691A40

; load SonicZeldaInfo on top of SonicInfo
0x02A60414 = nop
0x02A53680 = nop

; load ef_dl3_linksonic_speedrun instead of ef_ch_son_yh1_speedrun_loop
0x02A43FE0 = nop
0x02A44058 = nop
