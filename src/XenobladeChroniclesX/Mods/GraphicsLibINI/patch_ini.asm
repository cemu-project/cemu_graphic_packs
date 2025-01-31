[XCX_libini]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

;allocates memory to back up and restore registers r0-r31
ini_register_backup:
.uint 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
;allocates memory to back up and restore the link register (LR)
ini_linkregister_backup:
.uint 0

;over writes original ini file with 0's
DeleteINI:
addi r30, r22, -4
li r28, 0
_whileLoopDeleteINI:
    stwu r28, 4(r30)
    lbz r24, 4(r30)
    cmpwi r24, 0
    bne+ _whileLoopDeleteINI
blr

;passes PrintOnOff into the PrintSettings function wraper
PrintOnOffSettingsINImod:
lis r27, PrintOnOffINImod@hi
ori r27, r27, PrintOnOffINImod@l
b PrintSettingsINImod

;passes PrintStringValue into the PrintSettings function wraper
PrintStringValueSettingsINImod:
lis r27, PrintStringValueINImod@hi
ori r27, r27, PrintStringValueINImod@l
b PrintSettingsINImod

;passes Callsprintf directly into the PrintSettings function wraper
PrintFloatSettingsINImod:
lis r27, CallsprintfINImod@hi
ori r27, r27, CallsprintfINImod@l
b PrintSettingsINImod

;passes PrintAMVP into the PrintSettings function wraper
PrintAMVPSettingsINImod:
lis r27, PrintAMVPINImod@hi
ori r27, r27, PrintAMVPINImod@l
b PrintSettingsINImod

;takes in a pointer to a string(r22), and prints it
PrintSettingNameINImod:
lwzu r29, 4(r22)
addi r29, r29, -1
_whileloopPrintSettingNameINImod:
    lbzu r26, 1(r29)
    stbu r26, 1(r30)
    cmpwi r26, 0
    bne+ _whileloopPrintSettingNameINImod
blr

;prints new line character
PrintNewLineINImod:
li r26, 0x0D0A
sth r26, 0(r30)
addi r30, r30, 1
blr

;function wraper that takes in r20 and a function pointer(r27)
;loops the function by the ammount in r20
PrintSettingsINImod:
mflr r31
_forloopPrintSettingsINImod:
    bl PrintSettingNameINImod
    mtctr r27
    bctrl
    bl PrintNewLineINImod
    addic. r20, r20, -1
    bgt+ _forloopPrintSettingsINImod
mtlr r31
blr

;checks if the floating point precision is less than 0 or greater than 9
;if so set precision to 1 to prevent the game from crashing
CheckifPrecisionIsValidINImod:
cmpwi r26, 0x30+0
bge+ _ifPrecisionLessThan0INImod
    li r26, 0x30+1
_ifPrecisionLessThan0INImod:
cmpwi r26, 0x30+9
ble+ _ifPrecisionGreaterThan9INImod
    li r26, 0x30+1
_ifPrecisionGreaterThan9INImod:
blr

;calls the C function sprintf()
;takes in a pointer to a formating string by r4
;takes in an address to print to by r3
;takes in a float to print by f1
;outputs the last address printed to in r11
CallsprintfINImod:
mflr r29
lfsu f1, 4(r24)
lis r4, str_floating_precision_INImod@hi
ori r4, r4, str_floating_precision_INImod@l
lbzu r26, 1(r21)
addi r26, r26, 0x30
bl CheckifPrecisionIsValidINImod
stb r26, 2(r4)
or r3, r30, r30
CREQV 4*cr1+eq, 4*cr1+eq, 4*cr1+eq ;required for some reason
mtctr r25
bctrl ;bl sprintf
or r30, r11, r11
mtlr r29
blr

;takes in r23 and prints either on or off
PrintOnOffINImod:
lwzu r26, 4(r23)
stw r26, 0(r30)
_whileloopPrintOnOffINImod:
    lbzu r26, 1(r30)
    cmpwi r26, 0
    bne+ _whileloopPrintOnOffINImod
blr

;takes in a string pointer(r18), and hijacks PrintSettingName to print it
PrintStringValueINImod:
mflr r28
addi r30, r30, -1
or r19, r22, r22
or r22, r18, r18
bl PrintSettingNameINImod
or r18, r22, r22
or r22, r19, r19
mtlr r28
blr

;takes in a floating point(r24), and its precision(r21)
;calls sprintf() 3 times to print 3 floats sperated by a comma
PrintAMVPINImod:
mflr r28
lis r19, 0x202C
ori r19, r19, 0x2000
bl CallsprintfINImod
stb r19, 0(r30)
addi r30, r30, 3
addi r21, r21, -1
bl CallsprintfINImod
stb r19, 0(r30)
addi r30, r30, 3
addi r21, r21, -1
bl CallsprintfINImod
mtlr r28
blr

; r22 == 0x23f09100
; registers that do not need to be restored:
; r25 r24 r28 r10
EditINIforinimod:
;back up registers r0-r31
lis r10, ini_register_backup@ha
stmw r0, ini_register_backup@l(r10)
;back up link register
mflr r25
lis r10, ini_linkregister_backup@ha
stw r25, ini_linkregister_backup@l(r10)
;load the function pointer for the C function sprintf() into r25
lis r25, sprintfFunctionPointer@hi
ori r25, r25, sprintfFunctionPointer@l
;deletes the lib.ini file in ram so we can over write it with our own
bl DeleteINI

;r30 will track current position in file
addi r30, r22, -1
;r22 will keep track of the current setting
lis r22, lookuptable_settingname_INImod@ha
addi r22, r22, lookuptable_settingname_INImod@l-4
;r23 will keep track of on/off settings
lis r23, lookuptable_onoff_INImod@ha
addi r23, r23, lookuptable_onoff_INImod@l-4
;r24 will keep track of floating point numbers
lis r24, lookuptable_float_INImod@ha
addi r24, r24, lookuptable_float_INImod@l-4
;r21 will keep track of floating point precision
lis r21, lookuptable_float_precision_INImod@ha
addi r21, r21, lookuptable_float_precision_INImod@l-1
;r18 will keep track of string values (only used for luttex1 & cube)
lis r18, lookuptable_stringvalue_INImod@ha
addi r18, r18, lookuptable_stringvalue_INImod@l-4
;the r20 is how many times the loop executes, aka number of settings to print

;print all the on off settings at the begining of the file
li r20, 9
bl PrintOnOffSettingsINImod

;print luttex1 and cube setting
li r20, 2
bl PrintStringValueSettingsINImod

;print float settings until hitting an on/off setting
li r20, 41
bl PrintFloatSettingsINImod

;print red auto on/off setting
li r20, 1
bl PrintOnOffSettingsINImod

;print float settings until hitting an on/off setting
li r20, 14
bl PrintFloatSettingsINImod

;print blur on/off setting
li r20, 1
bl PrintOnOffSettingsINImod

;print float settings until hitting an on/off setting
li r20, 3
bl PrintFloatSettingsINImod

;print shadow half on/off setting
li r20, 1
bl PrintOnOffSettingsINImod

;print float settings until hitting an on/off setting
li r20, 3
bl PrintFloatSettingsINImod

;print sRGBmode on/off setting
li r20, 1
bl PrintOnOffSettingsINImod

;print float settings until hitting avmp settings
li r20, 11
bl PrintFloatSettingsINImod

;print avmp settings
li r20, 16
bl PrintAMVPSettingsINImod

;print last 2 float settings settings
li r20, 2
bl PrintFloatSettingsINImod

ExitEditINImod:
;restore registers r0-r31 & LR
lis r10, ini_linkregister_backup@ha
lwz r25, ini_linkregister_backup@l(r10)
mtlr r25
lis r10, ini_register_backup@ha
lmw r0, ini_register_backup@l(r10)
;restores line we over wrote and returns to the game
;lwz r22, 0xa0(r31)
addi r25,r1,0x38
blr


[XCX_libini_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
;pointer for the C function sprintf()
sprintfFunctionPointer = 0x03B18118
;patches the address with a branch link to the mod
0x02FF94C8 = bla EditINIforinimod

[XCX_libini_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
sprintfFunctionPointer = 0x03B18098
0x02FF9468 = bla EditINIforinimod

[XCX_libini_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
sprintfFunctionPointer = 0x03B134B0
0x02FF4990 = bla EditINIforinimod

[XCX_libini_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
sprintfFunctionPointer = 0x03B17F18
0x02FF92F0 = bla EditINIforinimod

[XCX_libini_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
sprintfFunctionPointer = 0x03B0DEB0
0x02FEF588 = bla EditINIforinimod
