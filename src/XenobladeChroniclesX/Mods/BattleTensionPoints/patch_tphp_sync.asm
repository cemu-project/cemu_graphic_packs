[XCX_BootWithTP_Sync]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
;currently missing features:
;being able to negatively correlate hp by its self or tp by its self
;finishing the currently unfinished tp only updates from hp (or vice versa)
;make hp gained from reving party members apply to sync settings
;inspired from a glitch that happened with "Weird: tp equal hp" in a in-dev version of the mod:
;setting your tp to only equal the last ammount of hp gained, with it reseting to 0 when taking damage (also a seperate option to make using tp also set it to 0)
;setting your hp to the last ammount of tp gained, but still allowing you to take damage from enemies



;list of know bugs:

;the current hp is bound the position in the character list
;so with the no heal on skip travel if you swap party members, the new party member will have the current hp of the party member who used to be in that slot (minor bug)

;if a characters base stats were to update without calling the boot section of the mod it would break the don't heal when skip traveling setting
;I do not think this bug is possible to happen but listing it hear incase it does (currently not a bug but has potential to be a major bug)

;when a party member is revived, their HP is updated from a seperate section of code
;so their TP won't match in the sync settings until the next update to hp or tp (minor bug)

;the one described in detail in tphp_data, that the NumOfTimesLoadingScreenRan variable mostly fixes (minor bug)

;weird: tp equals hp, will have a visual glitch when hitting max tp. this happens because the tp update section is called before the game updates tp (major bug for the setting) (but setting is really low priority)

;various other bugs related to weird: tp/hp equals hp/tp (major bug for the setting) (but setting is really low priority)



;storage space to conditionally back up registers r3-r31
RegistersBackUpTPHP:
.uint 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
;storeage space to back up link register
LinkRegisterBackUpTPHP:
.uint 0
CountRegisterBackupTPHP:
.uint 0

;function that allows us to conditionally branch link return
HPTPMod_blr:
blr

;function that has different entance points if your on ground or in a skell
;loads data from the tphp_data file that the mod needs to work
GetModDataInnerHPTP:
lis r31, RegistersBackUpTPHP@ha
stmw r14, RegistersBackUpTPHP@l(r31)
li r23, 0
lis r31, BoolIsInnerOrDoll@ha
stw r23, BoolIsInnerOrDoll@l(r31)
lis r31, LookupTableforInner@ha
addi r31, r31, LookupTableforInner@l-4
b GetModDataHPTP
GetModDataDollHPTP:
lis r31, RegistersBackUpTPHP@ha
stmw r14, RegistersBackUpTPHP@l(r31)
li r23, 1
lis r31, BoolIsInnerOrDoll@ha
stw r23, BoolIsInnerOrDoll@l(r31)
lis r31, LookupTableforDoll@hi
addi r31, r31, LookupTableforDoll@l-4
GetModDataHPTP:
lwzu r23, 4(r31) ; CheatSettingsArray
lwzu r24, 4(r31) ; SyncSettingsArray
lwzu r25, 4(r31) ; SlipHealSettingsArray
lwzu r27, 4(r31) ; BoolBootWithTP
lwzu r28, 4(r31) ; StoreCurrentHP
lwzu r29, 4(r31) ; StoreCharacterStatsPointers
blr

;function with multiple entrance points depeding of if applying a TP cheat, HP cheat, binding TP, or binding HP
;does some setup work at the entrance then if a cheat/setting is enabled, branches to the appropriate function from the function lookup table in tphp_data
CheckSyncSettingHP:
li r3, 0
mflr r0
bl HPStopSlipHealTP
mtlr r0
lbzu r31, 2(r24) ; $TPboundtoHP
li r19, currentHP
li r18, currentTP
b _LoadSyncFunctionPointers
CheckSyncSettingTP:
lwz r3, currentHP(r10)
cmpwi r3, 0
ble HPTPMod_blr
li r3, 0
lbz r31, 0(r24) ; $HPboundtoTP
addi r23, r23, 2
li r19, currentTP
li r18, currentHP
_LoadSyncFunctionPointers:
lis r30, FunctionPointerArraySync@hi
ori r30, r30, FunctionPointerArraySync@l
b CheckSettingsTPHP
CheckHealthCheat:
li r3, 4*4
lhz r31, 1*2(r23) ; $CheatHP
b CheckSettingsTPHP
CheckTensionCheat:
li r3, 0
lhz r31, 0*2(r23) ; $CheatTP
CheckSettingsTPHP:
cmpwi r31, 1
beq BranchToFoundCheat
addi r3, r3, 4
cmpwi r31, 2
beq BranchToFoundCheat
addi r3, r3, 4
cmpwi r31, 3
beq BranchToFoundCheat
addi r3, r3, 4
cmpwi r31, 4
beq BranchToFoundCheat
blr
BranchToFoundCheat:
lwzx r3, r30, r3
mtctr r3
bctr

;list of simple functions that get called from HP cheat and TP cheat settings.
NoTensionCheat:
li r31, 0
stw r31, currentTP(r10)
blr
TensionEqualsHealthCheat:
lwz r31, currentHP(r10)
stw r31, currentTP(r10)
blr
InfiniteTensionCheat:
lwz r31, maxTP(r10)
stw r31, currentTP(r10)
blr
NoHealthCheat:
li r31, 2
stw r31, currentHP(r10)
blr
HealthEqualsTensionCheat:
lwz r31, currentTP(r10)
stw r31, currentHP(r10)
blr
InfiniteHealthCheat:
lwz r31, maxHP(r10)
stw r31, currentHP(r10)
blr

;some of the functions above need to be a little bit different if calling them when HP updates or TP updates
HealthEqualsTensionCheatTP:
lwz r31, currentTP(r10)
add r31, r31, r21
stw r31, currentHP(r10)
blr
NoHealthCheatHP:
li r31, 2
stw r31, currentHP(r10)
lhz r12, 2*2(r23)
cmpw r21, r12
bge HPTPMod_blr
li r31, 0
stw r31, currentHP(r10)
blr

;unfinished and currently have their settings commented out in rules.txt
TensionUpdatesFromHealthCheatTP:
lhz r3, 1*2(r23) ; $HPCheat
cmpwi r31, 3
blr; _addTPtoHPEXit
HealthUpdatesFromTensionCheatTP:
lwz r31, 0x84(r10)
add r31, r31, r21
stw r31, 0x84(r10)
blr; _addTPtoHPEXit
TensionUpdatesFromHealthCheatHP:
blr; _addHPtoTPAsynchronous
HealthUpdatesFromTensionCheatHP:
lwz r12, 0x84(r10)
add r12, r12, r21
stw r12, 0x84(r10)
blr

;the function that synchronously binds HP & TP. is shared with HP updating and TP updating, but Boot has its own sperate sync function
addTPHPSynchronous:
addi r18, r18, 4
lwz r31, maxTP(r10)
lwz r12, maxHP(r10)
cmpw r12, r31
bgt _MaxTPSmallerintp
b _MaxHPSmallerintp
_MaxTPSmallerintp:
lwz r12, maxTP(r10)
_MaxHPSmallerintp:
lwzx r31, r10, r19
add r31, r31, r21
mflr r0
bl addTPHPComparetoMax
mtlr r0
lwzx r12, r10, r18
stwx r12, r10, r19
blr

;function that asynchronously binds HP & TP. has multiple entrance points if inclease only or decrease only are applied.
;shade with HP updating and TP updating. boot never calls async
addTPHPIncreaseOnly:
cmpwi r21, 0
blt HPTPMod_blr
b addTPHPAsynchronous
addTPHPDecreaseOnly:
cmpwi r21, 0
bgt HPTPMod_blr
addTPHPAsynchronous:
lhz r31, 0(r23) ; $CheatHP
cmpwi r31, 0
bne HPTPMod_blr
lbz r31, 1(r24) ; $HPboundtoTPNegative
cmpwi r31, 0
bne _addTPHPAsynchronousNegative
lwzx r31, r10, r18
add r31, r31, r21
addi r18, r18, 4
lwzx r12, r10, r18
b addTPHPComparetoMax
_addTPHPAsynchronousNegative:
lwzx r31, r10, r18
sub r31, r31, r21
addi r18, r18, 4
lwzx r12, r10, r18
b addTPHPComparetoMax

;function that gets called after async & sync settings. prevents us from having more HP/TP than out maximum
;CheckifTPNegative only gets called when HP updates. prevents negative TP as negative TP is glitchy.
;handling negative HP is not only unesisary but undesired as that is how the game checks for death
addTPHPComparetoMax:
addi r18, r18, -4
cmpw r12, r31
blt _hitMaximumHPTP
stwx r31, r10, r18
blr
_hitMaximumHPTP:
stwx r12, r10, r18
blr
CheckifTPNegative:
lbz r30, 0(r24) ; $TPboundtoHP
cmpwi r30, 0
beq HPTPMod_blr
cmpwi r31, 0
blt _hitMinimumTP
;stw r31, currentTP(r10)
blr
_hitMinimumTP:
li r12, 0
stw r12, currentTP(r10)
blr

;function that only gets called during the "boot" section of the mod.
;actually gets called every loading screen, every time a party member is added or removed, everytime your gear updates, etc.
;this backs up all of the characters permanent stats so that the hp update and tp update section of the mods can identify which character is being modified and update the apropriate hp backup int tphp_data
;boot is able to identify the characters because r26 broadcast which character is currently being modified
backUpCharacterStats:
li r31, 8
mtctr r31
mulli r31, r26, 4
lwzx r29, r29, r31
addi r29, r29, -4
lis r3, PointerStatsOffsets@ha
addi r3, r3, PointerStatsOffsets@l-2
_forloopbackUpCharacterStats:
    lhzu r30, 2(r3)
    lwzx r31, r10, r30
    stwu r31, 4(r29)
    bdnz _forloopbackUpCharacterStats
blr

;function only gets called during hp update and tp update
;it loops and checks for which character is currently being modified and updates their dedicated hp storage
;the hp storage is used for the "dont heal when skip traveling option"
;identifying a character by all their stats is pretty innefficient but couldn't find a better solution and this works
checkWhichCharacter:
addic. r20, r20, -1
blt DidNotFindCharacter
li r31, 8
mtctr r31
lis r3, PointerStatsOffsets@ha
addi r3, r3, PointerStatsOffsets@l-2
addi r26, r26, 4
lwzx r31, r29, r26
addi r31, r31, -4
_forloopCompareCharacterStats:
    lhzu r30, 2(r3)
    lwzx r22, r10, r30
    lwzu r19, 4(r31)
    cmpw r19, r22
    bne checkWhichCharacter
    bdnz _forloopCompareCharacterStats
lwz r22, 0x84(r10)
blr

;prep for the checkWhichCharacter function and exception exit if didn't find character
DidNotFindCharacter:
mtlr r0
blr
StoreCharacterHealth:
mflr r0
li r20, 4
li r26, -4
bl checkWhichCharacter
stwx r22, r28, r26
mtlr r0
blr



;####################################################################################################################
;####################################################################################################################
;####################################################################################################################

;only gets called in boot section.
;checks if to max tp every loading screen, if not checks if to max tp on boot
;there is a sequence of 1 byte flags for each character and their skell in hptp_data
;checks if the flag for the current character is set and if so does not apply the mod
;if the flag is not set this means that the function was never run before, which the first time it runs is when booting the game
;so max our tp and then set the flag so the mod doesn't max tp again
CheckifToMaxTP_Boot:
add r31, r27, r26
cmpwi r3, 0
bne _applymaxTP
cmpwi r30, 4
bgt HPTPMod_blr
lbz r3, 0(r31)
cmpwi r3, 0
bne HPTPMod_blr
_applymaxTP:
lwz r3, maxTP(r10)
stw r3, currentTP(r10)
li r3, 1
stb r3, 0(r31)
blr

;checks if the "no skip travel after heal setting is set.
;if so replaces our HP with the stored HP from the StoreCharacterHealth functions
;mod can easily identify which character to apply to by the value in r26
CheckNoHealAfterSkipTravel:
lbz r3, 2(r25) ; $skiptravelheal
cmpwi r3, 0
bne HPTPMod_blr
mulli r31, r26, 4
add r28, r28, r31
lwz r31, 0(r28)
cmpwi r31, 0
ble HPTPMod_blr
stw r31, currentHP(r10)
lbz r3, 0(r24) ; $synchronous
cmpwi r3, 1
beq _NoHealAfterSkipTravelWithSync
blr
_NoHealAfterSkipTravelWithSync:
mflr r30
addi r30, r30, 4
mtlr r30
stw r31, currentTP(r10)
blr

;specialized sync function for the boot section of the mod
CheckBootSynchronous:
lbz r3, 0(r24) ; $synchronous
cmpwi r3, 1
bne HPTPMod_blr
lwz r3, maxTP(r10)
lwz r31, maxHP(r10)
cmpw r31, r3
bgt _MaxTPSmallerbootsync
b _MaxHPSmallerbootsync
_MaxTPSmallerbootsync:
lwz r31, maxTP(r10)
_MaxHPSmallerbootsync:
stw r31, currentTP(r10)
stw r31, currentHP(r10)
blr

;free registers = r3 r23-r31 r0
;r26 = current character (0-3)
;r10 = pointer to character battle data
;main function of the boot section. multiple entrance depeding for ground characters and skells
;does entrance set up, calls the necissary functions, and the fixes everything at exit
BootWithTPInner:
mflr r0
;lis r31, LinkRegisterBackUpTPHP@ha
;stw r0, LinkRegisterBackUpTPHP@l(r31)
bl GetModDataInnerHPTP
lis r31, NumOfTimesLoadingScreenRan@ha
lwz r30, NumOfTimesLoadingScreenRan@l(r31)
addi r30, r30, 1
stw r30, NumOfTimesLoadingScreenRan@l(r31)
li r3, $everyloadingscreen
b BootWithTP
BootWithTPDoll:
mflr r0
;lis r31, LinkRegisterBackUpTPHP@ha
;stw r0, LinkRegisterBackUpTPHP@l(r31)
bl GetModDataDollHPTP
lis r31, NumOfTimesLoadingScreenRan@ha
lwz r30, NumOfTimesLoadingScreenRan@l(r31)
li r3, $everyloadingscreenSkell
BootWithTP:
bl CheckifToMaxTP_Boot
mfctr r31
lis r30, CountRegisterBackupTPHP@ha
stw r31, CountRegisterBackupTPHP@l(r30)
lis r30, FunctionPointerArrayCheatBoot@hi
ori r30, r30, FunctionPointerArrayCheatBoot@l
bl CheckTensionCheat
bl CheckHealthCheat
bl CheckNoHealAfterSkipTravel
bl CheckBootSynchronous
bl backUpCharacterStats
BootWithTPExit:
;lis r31, RegistersBackUpTPHP@ha
;lmw r14, RegistersBackUpTPHP@l(r31)
;lis r31, LinkRegisterBackUpTPHP@ha
;lwz r0, LinkRegisterBackUpTPHP@l(r31)
mtlr r0
lis r31, CountRegisterBackupTPHP@ha
lwz r30, CountRegisterBackupTPHP@l(r31)
mtctr r30
li r3, 1
blr



;####################################################################################################################
;####################################################################################################################
;####################################################################################################################

;this function only needs to exist because tp update is called before tp is applied
;and hp update is called after hp is applied
CheckifSyncNegTP:
lbz r31, 0(r24)
cmpwi r31, 1
bne HPTPMod_blr
lbz r31, 1(r24)
cmpwi r31, 0
beq HPTPMod_blr
neg r21, r21
blr

;this function only needs to exist because tp update is called before tp is applied
;prevents the game from updating TP because we just updated it ourselves
FixGameChangingTPWeChanged:
li r21, 0
blr
CheckifModifiedTP:
lhz r31, -2(r23) ; $CheatTP
cmpwi r31, 0
bne FixGameChangingTPWeChanged
lbz r31, 0(r24) ; $sync
cmpwi r31, 1
beq FixGameChangingTPWeChanged
blr


;is called before the game adds your TP
;free registers = r5, r31, r12, r0
;character battle data = the pointer that is pointed to by (r4 + 0x1d0)+0x1a0
;we then move that pointer into r10 so we can share code with boot & hp
;r27 holds the amount of TP that will be added, mod moves it into r21 to share code with hp
;main function of the tp update section. multiple entrance depeding for ground characters and skells
;does entrance set up, calls the necissary functions, and the fixes everything at exit
addTPtoHPInner:
lwz r5, 0(r4)
mflr r0
lis r31, LinkRegisterBackUpTPHP@ha
stw r0, LinkRegisterBackUpTPHP@l(r31)
or r12, r27, r27
bl GetModDataInnerHPTP
b addTPtoHP
addTPtoHPDoll:
lwz r5, 0(r6)
mflr r0
lis r31, LinkRegisterBackUpTPHP@ha
stw r0, LinkRegisterBackUpTPHP@l(r31)
or r12, r27, r27
bl GetModDataDollHPTP
addTPtoHP:
or r21, r12, r12
lis r30, FunctionPointerArrayCheatTP@hi
ori r30, r30, FunctionPointerArrayCheatTP@l
lwz r5, 0x1d0(r5)
addi r10, r5, 0x1a0
bl CheckTensionCheat
bl CheckHealthCheat
bl CheckifSyncNegTP
bl CheckSyncSettingTP
bl CheckifModifiedTP
bl StoreCharacterHealth
_addTPtoHPExit:
lis r31, LinkRegisterBackUpTPHP@ha
lwz r0, LinkRegisterBackUpTPHP@l(r31)
mtlr r0
or r0, r21, r21
lis r31, RegistersBackUpTPHP@ha
lmw r14, RegistersBackUpTPHP@l(r31)
or r27, r0, r0
lis r31, BoolIsInnerOrDoll@ha
lwz r31, BoolIsInnerOrDoll@l(r31)
cmpwi r31, 0
bne _addTPtoHPDollExit
_addTPtoHPInnerExit:
lwz r5, 0(r4)
blr
_addTPtoHPDollExit:
lwz r5, 0(r6)
blr



;####################################################################################################################
;####################################################################################################################
;####################################################################################################################

;this function checks the CurrentSlipHealPosition variable found in tphp_data
;it uses this variable to detect if the heal is currently an out of battle heal
;if so & if the users has set the mod to not update tp ot of battle
;then this prevents tp from updating from out of battle heals and only out of battle heals
HPStopSlipHealTP:
lbz r31, 0(r24) ; $TPboundtoHP
cmpwi r31, 1
beq HPTPMod_blr
lis r31, CurrentSlipHealPosition@ha
lwz r31, CurrentSlipHealPosition@l(r31)
cmpwi r31, 0
ble+ HPTPMod_blr
addi r12, r31, -1
lis r31, CurrentSlipHealPosition@ha
stw r12, CurrentSlipHealPosition@l(r31)
cmpwi r12, 0
mtlr r0
bgt+ HPTPMod_blr
li r12, 0
stw r12, CurrentSlipHealPosition@l(r31)
blr

;this function only needs to exist because hp update is called after hp is applied
;and tp update is called before tp is applied
CheckifSyncHP:
lbz r31, 2(r24)
cmpwi r31, 1
bne HPTPMod_blr
neg r21, r21
lbz r31, 3(r24)
cmpwi r31, 0
bne HPTPMod_blr
li r21, 0
blr

;free registers = r12, r31, r0
;r21 = amount of damage that was taken from HP (we neg r21 to share code with tp)
;r10 = pointer to character battle data
;main function of the hpupdate section. multiple entrance depeding for ground characters and skells
;does entrance set up, calls the necissary functions, and the fixes everything at exit
addHPtoTPInner:
mflr r0
lis r31, LinkRegisterBackUpTPHP@ha
stw r0, LinkRegisterBackUpTPHP@l(r31)
bl GetModDataInnerHPTP
b addHPtoTP
addHPtoTPDoll:
mflr r0
lis r31, LinkRegisterBackUpTPHP@ha
stw r0, LinkRegisterBackUpTPHP@l(r31)
bl GetModDataDollHPTP
addHPtoTP:
neg r21, r21
lis r30, FunctionPointerArrayCheatHP@hi
ori r30, r30, FunctionPointerArrayCheatHP@l
bl CheckHealthCheat
bl CheckTensionCheat
bl CheckifSyncHP
bl CheckSyncSettingHP
bl CheckifTPNegative
bl StoreCharacterHealth
addHPtoTPExit:
lis r31, LinkRegisterBackUpTPHP@ha
lwz r0, LinkRegisterBackUpTPHP@l(r31)
lis r31, RegistersBackUpTPHP@ha
lmw r14, RegistersBackUpTPHP@l(r31)
mtlr r0
lwz r12, 0x10(r30)
blr

;btw thank you for looking at my mod!
;as a little treat I discoved a fun game breaking cheat
;its not worth making a gfx for because all it does is remove the battle system from the game
;so like actually just breaks the game and makes it not work
;but still kinda funny for a few minutes
;you cannot target enemies, enemies cannot target you, and enemies cannot move, only play their idle animation
;0x022B7484 = nop ; 1.0.1E, 1.0.2U, 1.0.0E
;0x022B6E94 = nop ; 1.0.2J
;0x022B7414 = nop ; 1.0.1U, 1.0.0U
;0x022B6D20 = nop ; 1.0.0J

[XCX_BootWithTP_Sync_v101E_v102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;calls the boot section of the mod for ground characters
0x02367C1C = bla BootWithTPInner
;calls the boot section of the mod for Skells
0x02367E20 = bla BootWithTPDoll
;calls the tp section of the mod for ground characters
0x0212D620 = bla addTPtoHPInner
;calls the tp section of the mod for Skells
0x025E5A9C = bla addHPtoTPInner
;calls the hp section of the mod for ground characters
0x0212D6EC = bla addTPtoHPDoll
;calls the hp section of the mod for Skells
0x025CE770 = bla addHPtoTPDoll

[XCX_BootWithTP_Sync_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02367450 = bla BootWithTPInner
0x02367654 = bla BootWithTPDoll
0x0212D0EC = bla addTPtoHPInner
0x025E5078 = bla addHPtoTPInner
0x0212D1B8 = bla addTPtoHPDoll
0x025CDD4C = bla addHPtoTPDoll

[XCX_BootWithTP_Sync_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02367BAC = bla BootWithTPInner
0x02367DB0 = bla BootWithTPDoll
0x0212D620 = bla addTPtoHPInner
0x025E5A2C = bla addHPtoTPInner
0x0212D6EC = bla addTPtoHPDoll
0x025CE700 = bla addHPtoTPDoll

[XCX_BootWithTP_Sync_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x023672DC = bla BootWithTPInner
0x023674E0 = bla BootWithTPDoll
0x0212CE68 = bla addTPtoHPInner
0x025E459C = bla addHPtoTPInner
0x0212CF34 = bla addTPtoHPDoll
0x025CD270 = bla addHPtoTPDoll
