[XCX_OFFLINEWE]
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

; cfs::CfSocialManager::update((float))
0x022879D0 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))

; Autoriser accès aux missions d'escouade depuis la console réseau
0x02AC5C10 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline

; cfs::CfSocialManager::refreshOrderQuestInfo (called when select an entry in the network console)
0x022C805C = nop ; network test : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C8060 = nop ; network test

; collectQuestInfoWE__Q2_3cfs15CfSocialManagerFRQ2_2ml45resvector__tm__28_PQ2_3cfs17CfSocialQuestInfo
0x022C6254 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C6280 = li r3, 0x4EE9 ; Quest ID for WE - fw::SocialDataStore::getWorldEnemyQuest(const(unsigned int))
0x022C65A8 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

; collectQuestInfoFR__Q2_3cfs15CfSocialManagerFRQ2_2ml45resvector__tm__28_PQ2_3cfs17CfSocialQuestInfo
0x022C66CC = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C66FC = li r3, 0x4EED
0x022C6738 = nop ; network test?
0x022C6A5C = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))

0x022863A4 = nop ; or.       r0, r6, r7
0x022863CC = nop ; or.       r0, r6, r7
0x02286474 = li r7, 1 ; for getWERewardList

; Manage RPs & Appraisal
VarShareRP:
.int 0
;_shareAP = reloc(0x1039C174)
VarShareAP:
.int 0

_loadRP:
lis       r12, 0x0022
ori       r12, r12, 0x5510
blr
0x0282B2F0 = bla _loadRP ; __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo

; ######################################### TODO : get WERewardList (Telethia Stem Cell)

; cfs::CfSocialManager::getQuestDetailWE((cfs::CfSocialQuestInfoWE &))
; |- __CPR95__getWorldEnemyInfoFromQuest__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ34J14WorldEnemyInfo
0x0282B454 = li r3, 0 ; getWorldEnemyIndexFromQuestID / Uncomment to show Appraisal Rewards
; |- |- __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo
0x0282B0E4 = li r7, 1 ; cmpwi     r7, 0
0x0282B0FC = li r0, 1 ; cmpwi     r0, 0
0x0282B170 = li r6, 1 ; to store in 8(r26) -> needed for cmpwi r0, 1 after callback
0x0282B264 = nop ; skip deserializeWorldEnemy
0x0282B410 = li r4, 1 ; for getWERewardList

; cfs::CfSocialManager::getQuestDetailFR((cfs::CfSocialQuestInfoFR &))
0x0228989C = nop ; Uncomment to show Appraisal Rewards

[XCX_OFFLINEWE_1E] ############################################################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

.origin = codecave

; menu::MenuMultiQuestOrder::move((void))
; skip BLADE medals requirement on launch mission
0x02B9B0B0 = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

; menu::CTerminalMenu_PieceExchange::offline((void))
; Allow access to piece exchange from network console
_single:
li r3, 0
blr
0x02AC613C = ba _single ; menu::CBladeHomuMenu::single((void))

; __CPR129__getMultiQuestReward__Q2_3cfs15CfSocialManagerCFUiRQ2_3mtl68fixed_vector__tm__48_Q3_3cfsJ28J11QuestRewardXCUiL_2_46T1 --> OK
0x022CA324 = nop ; always all items?

[XCX_OFFLINEWE_2U] ############################################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

.origin = codecave

0x02B9B0A0 = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

_single:
li r3, 0
blr

0x02AC612C = ba _single

[XCX_OFFLINEWE_1U] ############################################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

.origin = codecave

0x02287960 = nop ; (network test?) allow call to cfs::CfSocialQuestManager::update((void))
0x02AC5B84 = li r3, 0 ; menu::CTerminalMenu_SquadQuest::offline
0x022C7FEC = nop ; network test : lwz       r10, 0x1B0(r30) --> rlwinm.   r9, r10, 0,30,30
0x022C7FF0 = nop ; network test
0x022C61E4 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C6210 = li r3, 0x4EE9 ; Quest ID for WE - fw::SocialDataStore::getWorldEnemyQuest(const(unsigned int))
0x022C6538 = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C668C = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022C668C = li r3, 0x4EED
0x022C66C8 = nop ; network test?
0x022C69EC = li r3, 1 ; fw::SocialDataStore::getWorldEnemyCount(const(void))
0x022863A4 = nop ; or.       r0, r6, r7
0x022863CC = nop ; or.       r0, r6, r7
0x02286474 = li r7, 1 ; for getWERewardList

_loadRP:
lis       r12, 0x0022
ori       r12, r12, 0x5510
blr
0x0282B274 = bla _loadRP ; __CPR86__getWorldEnemyInfo__Q2_2fw15SocialDataStoreCFUiRQ3_2fwJ25J14WorldEnemyInfo

0x0282B3D8 = li r3, 0 ; getWorldEnemyIndexFromQuestID / Uncomment to show Appraisal Rewards
0x0282B068 = li r7, 1 ; cmpwi     r7, 0
0x0282B080 = li r0, 1 ; cmpwi     r0, 0
0x0282B0F4 = li r6, 1 ; to store in 8(r26) -> needed for cmpwi r0, 1 after callback
0x0282B1E8 = nop ; skip deserializeWorldEnemy
0x0282B394 = li r4, 1 ; for getWERewardList
0x0228982C = nop ; Uncomment to show Appraisal Rewards
0x02B9AFB0 = li r3, 1 ; Disable call to menu::MenuMultiQuestOrder::canOrderWorldEnemy

_single:
li r3, 0
blr
0x02AC60B0 = ba _single ; menu::CBladeHomuMenu::single((void))

0x022CA2B4 = nop ; always all items?
