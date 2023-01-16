[XCX_OFFLINEWE]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $ygg   ;0x400D | mission ID for ygg
.int $teli  ;0x4008 or 0x4009 | mission ID's for teli
.int $nemesiscost ;sets blade medals cost of nemesis mission
.int $minmedals ;sets minimum blade medal count

; Manage RPs & Appraisal
VarShareRP:
.int 0
;_shareAP = reloc(0x1039C174) ; (1.0.1E, 1.0.2U)
VarShareAP:
.int 0

_loadRP:
lis       r12, 0x0022
ori       r12, r12, 0x5510
blr

; menu::CTerminalMenu_PieceExchange::offline((void))
; Allow access to piece exchange from network console
_single:
li r3, 0
blr

[XCX_OFFLINEWE_V101E_V102U] ; ######################################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; cfs::CfSocialManager::update((float))
0x022879D0 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))

; cfs::CfSocialManager::refreshOrderQuestInfo (called when select an entry in the network console)
0x022C805C = nop ; network test : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C8060 = nop ; network test

; collectQuestInfoWE__Q2_3cfs15CfSocialManagerFRQ2_2ml45resvector__tm__28_PQ2_3cfs17CfSocialQuestInfo
0x022C6254 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C6280 = li r3, $teli ; Quest ID for WE - fw::SocialDataStore::getWorldEnemyQuest(const(unsigned int))
0x022C65A8 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

; collectQuestInfoFR__Q2_3cfs15CfSocialManagerFRQ2_2ml45resvector__tm__28_PQ2_3cfs17CfSocialQuestInfo
0x022C66CC = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C66FC = li r3, $ygg
0x022C6738 = nop ; network test?
0x022C6A5C = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x022863A4 = nop ; or.       r0, r6, r7
0x022863CC = nop ; or.       r0, r6, r7
0x02286474 = li r7, 1 ; for getWERewardList

0x0282B2F0 = bla _loadRP ; __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo

; ######################################### TODO : get WERewardList (Telethia Stem Cell)
; cfs::CfSocialManager::getQuestDetailWE((cfs::CfSocialQuestInfoWE &))
; |- __CPR95__getWorldEnemyInfoFromQuest__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ34J14WorldEnemyInfo
0x0282B454 = li r3, 0 ; getWorldEnemyIndexFromQuestID
; |- |- __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo
0x0282B0E4 = li r7, 1 ; cmpwi     r7, 0
0x0282B0FC = li r0, 1 ; cmpwi     r0, 0
0x0282B170 = li r6, 1 ; to store in 8(r26) -> needed for cmpwi r0, 1 after callback
0x0282B264 = nop ; skip deserializeWorldEnemy
0x0282B410 = li r4, 1 ; for getWERewardList
; cfs::CfSocialManager::getQuestDetailFR((cfs::CfSocialQuestInfoFR &))
0x0228989C = nop ; show Appraisal Rewards

;BLADE Medal cheat
0x0288AA80 = subi r8, r3, $nemesiscost ; sets how much a mission cost
;Sets a minimum blade medal count ;replaces maximum blade medal cap
0x02888DEC = cmplwi r3, $minmedals
0x02888DF0 = bge 0x02888E08 ;LAB_02888e08
0x02888DFC = cmplwi r3, $minmedals
0x02888E00 = bge 0x02888E08 ;LAB_02888e08
0x02888E04 = li r3, $minmedals

[XCX_OFFLINEWE_V101E] ; ############################################################################################
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x02AC5C10 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
; menu::MenuMultiQuestOrder::move((void))
; skip BLADE medals requirement on launch mission
0x02B9B0B0 = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

; menu::CTerminalMenu_PieceExchange::offline((void))
; Allow access to piece exchange from network console
0x02AC613C = ba _single ; menu::CBladeHomuMenu::single((void))
; __CPR129__getMultiQuestReward__Q2_3cfs15CfSocialManagerCFUiRQ2_3mtl68fixed_vector__tm__48_Q3_3cfsJ28J11QuestRewardXCUiL_2_46T1 --> OK
0x022CA324 = nop ; always all items?

[XCX_OFFLINEWE_V102U] ; ############################################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02AC5C00 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x02B9B0A0 = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

0x02AC612C = ba _single ; menu::CBladeHomuMenu::single((void))
0x022CA324 = nop ; always all items? ;;

[XCX_OFFLINEWE_V102J] ; ############################################################################################
moduleMatches = 0x7672271D ; 1.0.2J
0x022873E8 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))
0x022C7A6C = nop ; network test : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C7A70 = nop ; network test

0x022C5C64 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C5C90 = li r3, $teli ; Quest ID for WE - fw::SocialDataStore::getWorldEnemyQuest(const(unsigned int))
0x022C5FB8 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x022C60DC = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C610C = li r3, $ygg
0x022C6148 = nop ; network test?
0x022C646C = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x02285E0C = nop ; or.       r0, r6, r7
0x02285E34 = nop ; or.       r0, r6, r7
0x02285EDC = li r7, 1 ; for getWERewardList

0x028284C8 = bla _loadRP ; __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo

0x0282862C = li r3, 0 ; getWorldEnemyIndexFromQuestID
0x028282BC = li r7, 1 ; cmpwi     r7, 0
0x028282D4 = li r0, 1 ; cmpwi     r0, 0
0x02828348 = li r6, 1 ; to store in 8(r26) -> needed for cmpwi r0, 1 after callback
0x0282843C = nop ; skip deserializeWorldEnemy
0x028285E8 = li r4, 1 ; for getWERewardList
0x022892B4 = nop ; show Appraisal Rewards

;BLADE Medal cheat
0x028879E0 = subi r8, r3, $nemesiscost
0x02885D4C = cmplwi r3, $minmedals
0x02885D50 = bge 0x02885D68 ;LAB_02885d68
0x02885D5C = cmplwi r3, $minmedals
0x02885D60 = bge 0x02885D68 ;LAB_02885d68
0x02885D64 = li r3, $minmedals

0x02AC22D0 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x02B96BCC = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

0x02AC27FC = ba _single ; menu::CBladeHomuMenu::single((void))
0x022C9D34 = nop ; always all items?

[XCX_OFFLINEWE_V100U] ; ############################################################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02287960 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))
0x022C7FEC = nop ; network test : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C7FF0 = nop ; network test

0x022C61E4 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C6210 = li r3, $teli ; Quest ID for WE - fw::SocialDataStore::getWorldEnemyQuest(const(unsigned int))
0x022C6538 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x022C665C = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C668C = li r3, $ygg
0x022C66C8 = nop ; network test?
0x022C69EC = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x022863A4 = nop ; or.       r0, r6, r7
0x022863CC = nop ; or.       r0, r6, r7
0x02286474 = li r7, 1 ; for getWERewardList

0x0282B274 = bla _loadRP ; __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo

0x0282B3D8 = li r3, 0 ; getWorldEnemyIndexFromQuestID
0x0282B068 = li r7, 1 ; cmpwi     r7, 0
0x0282B080 = li r0, 1 ; cmpwi     r0, 0
0x0282B0F4 = li r6, 1 ; to store in 8(r26) -> needed for cmpwi r0, 1 after callback
0x0282B1E8 = nop ; skip deserializeWorldEnemy
0x0282B394 = li r4, 1 ; for getWERewardList
0x0228982C = nop ; show Appraisal Rewards

;BLADE Medal cheat
0x0288AA04 = subi r8, r3, $nemesiscost
0x02888D70 = cmplwi r3, $minmedals
0x02888D74 = bge 0x02888D8C ;LAB_02888d8c
0x02888D80 = cmplwi r3, $minmedals
0x02888D84 = bge 0x02888D8C ;LAB_02888d8c
0x02888D88 = li r3, $minmedals

0x02AC5B84 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x02B9AFB0 = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

0x02AC60B0 = ba _single ; menu::CBladeHomuMenu::single((void))
0x022CA2B4 = nop ; always all items?

[XCX_OFFLINEWE_V100J] ; ############################################################################################
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x0228713C = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))
0x022C78F8 = nop ; network test : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C78FC = nop ; network test

0x022C5AF0 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C5B1C = li r3, $teli ; Quest ID for WE - fw::SocialDataStore::getWorldEnemyQuest(const(unsigned int))
0x022C5E44 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x022C5F68 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C5F98 = li r3, $ygg
0x022C5FD4 = nop ; network test?
0x022C62F8 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x02285B60 = nop ; or.       r0, r6, r7
0x02285B88 = nop ; or.       r0, r6, r7
0x02285C30 = li r7, 1 ; for getWERewardList

0x0282749C = bla _loadRP ; __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo

0x02827600 = li r3, 0 ; getWorldEnemyIndexFromQuestID
0x02827290 = li r7, 1 ; cmpwi     r7, 0
0x028272A8 = li r0, 1 ; cmpwi     r0, 0
0x0282731C = li r6, 1 ; to store in 8(r26) -> needed for cmpwi r0, 1 after callback
0x02827410 = nop ; skip deserializeWorldEnemy
0x028275BC = li r4, 1 ; for getWERewardList
0x02289008 = nop ; show Appraisal Rewards

;BLADE Medal cheat
0x02886608 = subi r8, r3, $nemesiscost
0x02884974 = cmplwi r3, $minmedals
0x02884978 = bge 0x02884990 ;LAB_02884990
0x02884984 = cmplwi r3, $minmedals
0x02884988 = bge 0x02884990 ;LAB_02884990
0x0288498C = li r3, $minmedals

0x02AC04E8 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x02B94268 = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

0x02AC0A14 = ba _single ; menu::CBladeHomuMenu::single((void))
0x022C9BC0 = nop ; always all items?
