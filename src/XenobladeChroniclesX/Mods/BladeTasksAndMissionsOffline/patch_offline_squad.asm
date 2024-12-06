[XCX_SQUADMISSIONS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

;######### Change Squad Mission using main menu
VarSquadMission:
.int 0

_iniPtr:
li r5, 0
lis r30, VarSquadMission@ha
stw r5, VarSquadMission@l(r30)
mr r30, r3
blr

;######### Force Squad Mission number
_forceMission:
lmw r14, 0x1B8(r1)
li r4, $missionId
cmpwi r4, 0
beqlr
mr r3, r4
blr

;######### Force Squad Mission number 1.0.0J --not working
;_forceMissionJP:
;lmw r15, 0x1AC(r1) ;
;li r4, $missionId
;cmpwi r4, 0
;beqlr
;mr r3, r4
;blr

;######### Change Squad Mission using main menu
_savePtr:
li r3, 1
lis r30, VarSquadMission@ha
stw r3, VarSquadMission@l(r30)
blr


[XCX_SQUADMISSIONS_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;################## Activate Squad Tasks
; cfs::CfSocialManager::update((float))
0x022879D0 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))

; cfs::CfSocialQuestManager::update((void))
0x023AB884 = nop ; 0x6B8(r12) == 0
0x023AB8B4 = nop ; isHost
0x023ABA68 = li r5, 60 ; force 0x24 - UNLOCK
0x023ABC10 = nop ; isHost
0x023A0484 = nop ; isHost
0x023ABCAC = nop ; compare with 0x28 - UNLOCK
0x023ABCB8 = nop ; compare with 0x2C - UNLOCK

;################## BLADE Home Terminal (for Squad Quest Selection)
; cfs::CfSocialManager::refreshOrderQuestInfo (called when select an entry in the BLADE menu)
0x022C805C = nop ; test réseau : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C8060 = nop ; test réseau

; collectQuestInfoSQ__Q2_3cfs15CfSocialManagerFRQ2_2ml45resvector__tm__28_PQ2_3cfs17CfSocialQuestInfo
0x022C58BC = nop ; rlwinm.   r10, r11, 0,29,29

; cfs::CfSquadMissionManager::joinMission((cfs::CfSquadTargetCount const &))
0x023B74A0 = bla _iniPtr

; cfs::CfSocialQuestManager::update((void))
0x023ABDF4 = _gotoTimeout:
0x023ABE54 = _gotoNext:

0x023ABDC8 = lis r3, VarSquadMission@ha
0x023ABDCC = lwz r7, VarSquadMission@l(r3)
0x023ABDD0 = cmpwi r7, 1
0x023ABDD4 = beq _gotoTimeout
0x023ABDD8 = b _gotoNext

0x023AB7C4 = bla _forceMission

;####################################################################################################
[XCX_SQUADMISSIONS_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E

; getServerTimeSec__Q2_2nt10CNetLibNexCFRUL
0x0295EA10 = nop
0x0295EA14 = li r0, 42

; menu::MenuSquadMission::process((void))
0x02BFC7C0 = li r11, 1 ; garder affichée la liste des tasks en bas à droite ; keep displayed the list of tasks at the bottom right

;################## BLADE Home Terminal (for Squad Quest Selection)
0x02AC5C10 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline

;################## Change Squad Mission using main menu
0x02B85134 = bla _savePtr
0x02B8514C = bla _savePtr

0x02B85084 = li r11, 1
0x02B850A8 = li r11, 1

;####################################################################################################
[XCX_SQUADMISSIONS_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U

; getServerTimeSec__Q2_2nt10CNetLibNexCFRUL
0x0295EA00 = nop
0x0295EA04 = li r0, 42

; menu::MenuSquadMission::process((void))
0x02BFC7B0 = li r11, 1 ; garder affichée la liste des tasks en bas à droite ; keep displayed the list of tasks at the bottom right

;################## BLADE Home Terminal (for Squad Quest Selection)
0x02AC5C00 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline

;################## Change Squad Mission using main menu
0x02B85124 = bla _savePtr
0x02B8513C = bla _savePtr

0x02B85074 = li r11, 1
0x02B85098 = li r11, 1

;####################################################################################################
[XCX_SQUADMISSIONS_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x022873E8 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))
0x023AB068 = nop ; 0x6B8(r12) == 0
0x023AB098 = nop ; isHost
0x023AB24C = li r5, 60 ; force 0x24 - UNLOCK
0x023AB3F4 = nop ; isHost
0x0239FCB8 = nop ; isHost
0x023AB490 = nop ; compare with 0x28 - UNLOCK
0x023AB49C = nop ; compare with 0x2C - UNLOCK
0x022C7A6C = nop ; test réseau : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C7A70 = nop ; test réseau
0x022C52CC = nop ; rlwinm.   r10, r11, 0,29,29

0x023B6C84 = bla _iniPtr

0x023AB5D8 = _gotoTimeout:
0x023AB638 = _gotoNext:

0x023AB5AC = lis r3, VarSquadMission@ha
0x023AB5B0 = lwz r7, VarSquadMission@l(r3)
0x023AB5B4 = cmpwi r7, 1
0x023AB5B8 = beq _gotoTimeout
0x023AB5BC = b _gotoNext

0x023AAFA8 = bla _forceMission

0x0295B7EC = nop
0x0295B7F0 = li r0, 42
0x02BF81D0 = li r11, 1 ; garder affichée la liste des tasks en bas à droite ; keep displayed the list of tasks at the bottom right
0x02AC22D0 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x02B81070 = bla _savePtr
0x02B81088 = bla _savePtr
0x02B80FC0 = li r11, 1
0x02B80FE4 = li r11, 1

;####################################################################################################
[XCX_SQUADMISSIONS_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02287960 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))
0x023AB814 = nop ; 0x6B8(r12) == 0
0x023AB844 = nop ; isHost
0x023AB9F8 = li r5, 60 ; force 0x24 - UNLOCK
0x023ABBA0 = nop ; isHost
0x023A0414 = nop ; isHost
0x023ABC3C = nop ; compare with 0x28 - UNLOCK
0x023ABC48 = nop ; compare with 0x2C - UNLOCK
0x022C7FEC = nop ; test réseau : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C7FF0 = nop ; test réseau
0x022C584C = nop ; rlwinm.   r10, r11, 0,29,29

0x023B7430 = bla _iniPtr

0x023ABD84 = _gotoTimeout:
0x023ABDE4 = _gotoNext:

0x023ABD58 = lis r3, VarSquadMission@ha
0x023ABD5C = lwz r7, VarSquadMission@l(r3)
0x023ABD60 = cmpwi r7, 1
0x023ABD64 = beq _gotoTimeout
0x023ABD68 = b _gotoNext

0x023AB754 = bla _forceMission

0x0295E984 = nop
0x0295E988 = li r0, 42
0x02BFC6C0 = li r11, 1 ; garder affichée la liste des tasks en bas à droite ; keep displayed the list of tasks at the bottom right
0x02AC5B84 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x02B850A8 = bla _savePtr
0x02B850C0 = bla _savePtr
0x02B84FF8 = li r11, 1
0x02B8501C = li r11, 1

;####################################################################################################
;[XCX_SQUADMISSIONS_V100J]   ;;;;;; 1.0.0J broken, not working (';' is comment symbol)
;moduleMatches = 0x785CA8A9 ; 1.0.0J
;0x0228713C = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))
;0x023AAC20 = nop ; 0x6B8(r12) == 0
;0x023AAC50 = nop ; isHost
;0x023AADA4 = li r9, 60 ; force 0x24 - UNLOCK ;
;0x023AAF4C = nop ; isHost
;0x0239F9A4 = nop ; isHost
;0x023AAFE8 = nop ; compare with 0x28 - UNLOCK
;0x023AAFF4 = nop ; compare with 0x2C - UNLOCK
;0x022C78F8 = nop ; test réseau : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
;0x022C78FC = nop ; test réseau
;0x022C5158 = nop ; rlwinm.   r10, r11, 0,29,29

;0x023B6168 = bla _iniPtr

;0x023AB134 = _gotoTimeout: ;
;0x023AB194 = _gotoNext: ;

;0x023AB104 = lis r12, VarSquadMission@ha ;
;0x023AB108 = lwz r12, VarSquadMission@l(r12) ;
;0x023AB10C = cmpwi r12, 1 ;
;0x023AB110 = beq _gotoTimeout
;0x023AB114 = b _gotoNext

;0x023AAB68 = bla _forceMissionJP ;

;0x0295A05C = nop
;0x0295A060 = li r0, 42
;0x02BF5364 = li r11, 1 ; garder affichée la liste des tasks en bas à droite ; keep displayed the list of tasks at the bottom right
;0x02AC04E8 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
;0x02B7EAC0 = bla _savePtr
;0x02B7EAD8 = bla _savePtr
;0x02B7EA10 = li r11, 1
;0x02B7EA34 = li r11, 1
