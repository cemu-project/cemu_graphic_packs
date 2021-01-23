[XCX_SQUADMISSIONS]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

;#################### Activate Squad Tasks

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

;##################### BLADE Home Terminal (for Squad Quest Selection)

; cfs::CfSocialManager::refreshOrderQuestInfo (called when select an entry in the BLADE menu)
0x022C805C = nop ; test réseau : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C8060 = nop ; test réseau

; collectQuestInfoSQ__Q2_3cfs15CfSocialManagerFRQ2_2ml45resvector__tm__28_PQ2_3cfs17CfSocialQuestInfo
0x022C58BC = nop ; rlwinm.   r10, r11, 0,29,29

;#################### Change Squad Mission using main menu

VarSquadMission:
.int 0

_iniPtr:
li r5, 0
lis       r30, VarSquadMission@ha
stw       r5, VarSquadMission@l(r30)
mr 	   r30, r3
blr

; cfs::CfSquadMissionManager::joinMission((cfs::CfSquadTargetCount const &))
0x023B74A0 = bla _iniPtr

; cfs::CfSocialQuestManager::update((void))
0x023ABDF4 = _gotoTimeout:
0x023ABE54 = _gotoNext:

0x023ABDC8 = lis       r3, VarSquadMission@ha
0x023ABDCC = lwz      r7, VarSquadMission@l(r3)
0x023ABDD0 = cmpwi r7, 1
0x023ABDD4 = beq _gotoTimeout
0x023ABDD8 = b _gotoNext

#################### Force Squad Mission number
.origin = codecave
.int $missionId

_forceMission:
lmw	r14, 0x1B8(r1)
li	 	r4, $missionId
cmpwi	r4, 0
beqlr
mr		r3, r4
blr

0x023AB7C4 = bla _forceMission

#################### Change Squad Mission using main menu

_savePtr:
li 	 	  r3, 1
lis       r30, VarSquadMission@ha
stw       r3, VarSquadMission@l(r30)
blr

#####################################################################################################
[XCX_SQUADMISSIONS_1E]
moduleMatches = 0xF882D5CF ; 1.0.1E

; getServerTimeSec__Q2_2nt10CNetLibNexCFRUL
0x0295EA10 = nop
0x0295EA14 = li r0, 42

; menu::MenuSquadMission::process((void))
0x02BFC7C0 = li r11, 1 ; garder affichée la liste des tasks en bas à droite

##################### BLADE Home Terminal (for Squad Quest Selection)

0x02AC5C10 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline

#################### Change Squad Mission using main menu

0x02B85134 = bla _savePtr
0x02B8514C = bla _savePtr

0x02B85084 = li r11, 1
0x02B850A8 = li r11, 1

#####################################################################################################
[XCX_SQUADMISSIONS_2U]
moduleMatches = 0x30B6E091 ; 1.0.2U

; getServerTimeSec__Q2_2nt10CNetLibNexCFRUL
0x0295EA00 = nop
0x0295EA04 = li r0, 42

; menu::MenuSquadMission::process((void))
0x02BFC7B0 = li r11, 1

##################### BLADE Home Terminal (for Squad Quest Selection)

0x02AC5C00 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline

#################### Change Squad Mission using main menu

0x02B85124 = bla _savePtr
0x02B8513C = bla _savePtr

0x02B85074 = li r11, 1
0x02B85098 = li r11, 1

#####################################################################################################
[XCX_SQUADMISSIONS_1U]
moduleMatches = 0xAB97DE6B ; 1.0.1U

.origin = codecave

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

VarSquadMission:
.int 0

_iniPtr:
li r5, 0
lis       r30, VarSquadMission@ha
stw       r5, VarSquadMission@l(r30)
mr 	   r30, r3
blr

0x023B7430 = bla _iniPtr

0x023ABD84 = _gotoTimeout:
0x023ABDE4 = _gotoNext:

0x023ABD58 = lis       r3, VarSquadMission@ha
0x023ABD5C = lwz      r7, VarSquadMission@l(r3)
0x023ABD60 = cmpwi r7, 1
0x023ABD64 = beq _gotoTimeout
0x023ABD68 = b _gotoNext

#################### Force Squad Mission number
.int $missionId

_forceMission:
lmw	r14, 0x1B8(r1)
li	 	r4, $missionId
cmpwi	r4, 0
beqlr
mr		r3, r4
blr

0x023AB754 = bla _forceMission

#################### Change Squad Mission using main menu

_savePtr:
li 	 	  r3, 1
lis       r30, VarSquadMission@ha
stw       r3, VarSquadMission@l(r30)
blr

0x0295E984 = nop
0x0295E988 = li r0, 42
0x02BFC6C0 = li r11, 1 ; garder affichée la liste des tasks en bas à droite
0x02AC5B84 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x02B850A8 = bla _savePtr
0x02B850C0 = bla _savePtr
0x02B84FF8 = li r11, 1
0x02B8501C = li r11, 1