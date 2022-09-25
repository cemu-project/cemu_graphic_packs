[XCX_FREECAM_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;this mod accesses the developer freecam used by the monolith soft devs
;'nop' makes it so that the specified line never executes

; in func exe_normal__Q2_3Cam8CCamCtrlFv
0x022261BC = nop ;isFreeCamera__Q2_3cfs14CfSceneManagerCFv
; in func isControl__Q2_3cfs9CfObjUtilSFPQ2_3cfs5CfObj
0x0244F930 = nop ;isFreeCamera__Q2_3cfs14CfSceneManagerCFv
; in func isControl__Q2_3cfs18CfCompoActionActorCFPQ2_3cfs5CfObj
0x02467090 = nop ;isFreeCamera__Q2_3cfs14CfSceneManagerCFv
; in func updateBefore__Q2_3cfs16CfCompoCtrlActorFf
0x025532E8 = nop ;isFreeCamera__Q2_3cfs14CfSceneManagerCFv
; in func update__Q2_3cfs14CfSceneFreeCamFv
0x02601CFC = nop ;isFreeCamera__Q2_3cfs14CfSceneManagerCFv
; in func dispFieldCamera__Q2_2ev16CUIManagerAlwaysFb
0x0276A774 = nop ;MenuTask::openHudEventCamera

[XCX_FREECAM_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02225C88 = nop
0x0244EF70 = nop
0x024666D0 = nop
0x025528C4 = nop
0x026012D8 = nop
0x02768EEC = nop

[XCX_FREECAM_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x022261BC = nop
0x0244F8C0 = nop
0x02467020 = nop
0x02553278 = nop
0x02601C8C = nop
0x0276A714 = nop

[XCX_FREECAM_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02225A04 = nop
0x0244E494 = nop
0x02465BF4 = nop
0x02551DE8 = nop
0x026007FC = nop
0x02767F7C = nop
