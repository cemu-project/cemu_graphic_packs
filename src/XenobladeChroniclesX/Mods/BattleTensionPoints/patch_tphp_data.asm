[XCX_BootWithTP_Data]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

;adress offsets for all the various stats a character has
currentHP = 0x84
currentTP = 0x94
maxHP = 0x88
maxTP = 0x98
meleeAttack = 0x9C
rangedAttack = 0xA0
potential = 0xA4
defence = 0xA8
meleeAccuracy = 0xAC
rangedAccuracy = 0xB0
evasion = 0xB4

;array of flags that check if applied max tp on boot to a specific character/skell
BoolBootWithTP:
.byte $QoL-1, $QoL-1, $QoL-1, $QoL-1, $QoLSkell-1, $QoLSkell-1, $QoLSkell-1, $QoLSkell-1
;keeps track if entered a function from ground or skell so that code that only applies to one can be conditionally executed
BoolIsInnerOrDoll:
.uint 0
;prevents a bug of delayed character getting max tp after boot
;if a character position is not in your party at boot and then you add a character to that position
;its flag was never set and so that character then gets the mod applied to them way later than expected.
;with this fix it is still possible to trigure it by starting with exactly 1 character in your party and then recruiting a character within 1 skip travel
;the bug can also happen by seeing a loading screen over 2 billion times to loop to negative (end even then won't apply to positions that its already applies before)
;that is such specific circumstances with such a minor bug that I don't care to fix it further
;the proper way to fix this would be to find a section of code that runs after ground boot and skell boot, does not need skell boot to happen to run, and does not get called in any other section of the game.
;then uses that spot set the flags above and nothing else. currently not worth it for such a minor bug
NumOfTimesLoadingScreenRan:
.uint 0
;array of cheat settings for ground
InnerCheatSettingsArray:
.short $TPCheat, $HPCheat, $noHPcheatnodieifdamagelt, $TPupdatecheatdieat0TP, $TPupdatecheatnegative, $HPupdatecheatnegative
;array of cheat settings for skell
DollCheatSettingsArray:
.short $TPCheatSkell, $HPCheatSkell, $noHPcheatnodieifdamageltSkell, $TPupdatecheatdieat0TPSkell, $TPupdatecheatnegativeSkell, $HPupdatecheatnegativeSkell
;array of syncronous settings for ground
InnerSyncSettingsArray:
.byte $HPboundtoTP, $HPboundtoTPNegative, $TPboundtoHP, $TPboundtoHPNegative
;array of syncronous settings for skell
DollSyncSettingsArray:
.byte $HPboundtoTPSkell, $HPboundtoTPNegativeSkell, $TPboundtoHPSkell, $TPboundtoHPNegativeSkell
;array of after battle heal settings for ground
InnerSlipHealSettingsArray:
.byte $afterbattleheal, $afterbattlerestoretp, $skiptravelheal
;array of after battle heal settings for ground
DollSlipHealSettingsArray:
.byte $afterbattleheal, $afterbattlerestoretp, $skiptravelhealSkell
;storage space for current hp for each character
StoreCurrentHP:
.uint 0, 0, 0, 0
;storage space for current hp for each skell
StoreCurrentHPDoll:
.uint 0, 0, 0, 0
;array of pointers to the storage space for characters stats
;below that, the stprage space for each characters stats
StoreCharacterStatsPointers:
.uint StoreCharacter0Stats, StoreCharacter1Stats, StoreCharacter2Stats, StoreCharacter3Stats
StoreCharacter0Stats:
.uint 0, 0, 0, 0, 0, 0, 0, 0
StoreCharacter1Stats:
.uint 0, 0, 0, 0, 0, 0, 0, 0
StoreCharacter2Stats:
.uint 0, 0, 0, 0, 0, 0, 0, 0
StoreCharacter3Stats:
.uint 0, 0, 0, 0, 0, 0, 0, 0
;array of pointers to the storage space for skells stats
;below that, the stprage space for each skells stats
StoreCharacterStatsDollPointers:
.uint StoreCharacter0StatsDoll, StoreCharacter1StatsDoll, StoreCharacter2StatsDoll, StoreCharacter3StatsDoll
StoreCharacter0StatsDoll:
.uint 0, 0, 0, 0, 0, 0, 0, 0
StoreCharacter1StatsDoll:
.uint 0, 0, 0, 0, 0, 0, 0, 0
StoreCharacter2StatsDoll:
.uint 0, 0, 0, 0, 0, 0, 0, 0
StoreCharacter3StatsDoll:
.uint 0, 0, 0, 0, 0, 0, 0, 0
;array of offsets for each of the stats. used to lower code duplication
PointerStatsOffsets:
.short maxHP, meleeAttack, rangedAttack, potential, defence, meleeAccuracy, rangedAccuracy, evasion
;multiple function pointers arrays used to make the checksetting function usable for all setting types from all sections:
FunctionPointerArrayCheatBoot:
.uint NoTensionCheat, InfiniteTensionCheat, TensionEqualsHealthCheat, HPTPMod_blr, NoHealthCheat, InfiniteHealthCheat, HealthEqualsTensionCheat, HPTPMod_blr
FunctionPointerArrayCheatTP:
.uint NoTensionCheat, InfiniteTensionCheat, TensionEqualsHealthCheat, TensionUpdatesFromHealthCheatTP, NoHealthCheat, InfiniteHealthCheat, HealthEqualsTensionCheatTP, HealthUpdatesFromTensionCheatTP
FunctionPointerArrayCheatHP:
.uint NoTensionCheat, InfiniteTensionCheat, TensionEqualsHealthCheat, TensionUpdatesFromHealthCheatHP, NoHealthCheatHP, InfiniteHealthCheat, HealthEqualsTensionCheat, HealthUpdatesFromTensionCheatHP
FunctionPointerArraySync:
.uint addTPHPSynchronous, addTPHPAsynchronous, addTPHPDecreaseOnly, addTPHPIncreaseOnly
;lookup table for all the settings above if applying to ground characters
LookupTableforInner:
.uint InnerCheatSettingsArray, InnerSyncSettingsArray, InnerSlipHealSettingsArray, BoolBootWithTP, StoreCurrentHP, StoreCharacterStatsPointers
;lookup table for all the settings above if applying to skells
LookupTableforDoll:
.uint DollCheatSettingsArray, DollSyncSettingsArray, DollSlipHealSettingsArray, BoolBootWithTP+4, StoreCurrentHPDoll, StoreCharacterStatsDollPointers

;only piece of data used in the tphp_features file
;is used to tell the update hp function of the mod if the current heal is an out of battle heal
CurrentSlipHealPosition:
.uint 0
