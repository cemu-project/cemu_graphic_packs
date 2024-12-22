[XCX_libini]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

;string values for luttex1 and cube setting
value_luttex1:
.uint $luttex1_s1, $luttex1_s2, 0 ;if a larger string is needed, add $luttex1_s3, $luttex1_s4, etc. to before the 0
value_cube:
.uint $cube_s1, 0 ;if a larger string is needed, add $cube_s2, $cube_s3, etc. to before the 0

;list of strings that are in the lib.ini file
;this mod will be reprinting them
str_tonemap:
.string "tonemap="
str_ssao:
.string "ssao="
str_bloom:
.string "bloom="
str_godray:
.string "godray="
str_AntiAliasing:
.string "AntiAliasing="
str_ColReduction:
.string "ColReduction="
str_dof:
.string "dof="
str_lensFlare:
.string "lensFlare="

str_lut:
.string "lut="
str_luttex1:
.string "luttex1="

str_cube:
.string "cube="

str_tonemax:
.string "tonemax="
str_tonemin:
.string "tonemin="
str_tonemul:
.string "tonemul="
str_toneLastmul:
.string "toneLastmul="
str_toneBlmmax:
.string "toneBlmmax="
str_toneBlmmin:
.string "toneBlmmin="
str_toneBlmmul:
.string "toneBlmmul="
str_toneBlmLastmul:
.string "toneBlmLastmul="

str_godray_inival:
.string "godray_inival="
str_godray_decay:
.string "godray_decay="
str_godray_scale:
.string "godray_scale="

str_blm_border_sub:
.string "blm_border_sub="
str_blm_border_mul:
.string "blm_border_mul="
str_blm_border_sub2:
.string "blm_border_sub2="
str_blm_border_mul2:
.string "blm_border_mul2="
str_blm_border_max:
.string "blm_border_max="
str_blm_tex_mul:
.string "blm_tex_mul="
str_blm_blurscale1:
.string "blm_blurscale1="
str_blm_blurscale2:
.string "blm_blurscale2="
str_blm_blurscale3:
.string "blm_blurscale3="
str_blm_blurRange1:
.string "blm_blurRange1="
str_blm_blurRange2:
.string "blm_blurRange2="
str_blm_blurRange3:
.string "blm_blurRange3="
str_blm_scale1:
.string "blm_scale1="
str_blm_scale2:
.string "blm_scale2="
str_blm_scale3:
.string "blm_scale3="

str_lens_max:
.string "lens_max="
str_lens_rot:
.string "lens_rot="
str_lens_sub:
.string "lens_sub="
str_lens_mul:
.string "lens_mul="
str_lens_weight:
.string "lens_weight="
str_lens_decay:
.string "lens_decay="
str_lens_str:
.string "lens_str="
str_lens_paMax:
.string "lens_paMax="
str_lens_UVDecay:
.string "lens_UVDecay="

str_AA_Sharpness:
.string "AA_Sharpness="
str_AA_Range:
.string "AA_Range="
str_AA_Threshold:
.string "AA_Threshold="
str_AA_ThresholdMin:
.string "AA_ThresholdMin="

str_red_sclX:
.string "red_sclX="
str_red_sclY:
.string "red_sclY="

str_red_Auto:
.string "red_Auto="
str_red_AtMaxX:
.string "red_AtMaxX="
str_red_AtMaxY:
.string "red_AtMaxY="
str_red_AtMinX:
.string "red_AtMinX="
str_red_AtMinY:
.string "red_AtMinY="
str_red_AtRate:
.string "red_AtRate="

str_ao_Lengs:
.string "ao_Lengs="
str_ao_LengsRatio:
.string "ao_LengsRatio="
str_ao_range:
.string "ao_range="
str_ao_rangeRatio:
.string "ao_rangeRatio="
str_ao_sub:
.string "ao_sub="
str_ao_subRatio:
.string "ao_subRatio="
str_ao_Mul:
.string "ao_Mul="
str_ao_blurRange:
.string "ao_blurRange="
str_ao_blurScale:
.string "ao_blurScale="

str_blur:
.string "blur="
str_blurStr:
.string "blurStr="
str_blurSub:
.string "blurSub="

str_shadowStr:
.string "shadowStr="
str_shadowHalf:
.string "shadowHalf="

str_simShwStr:
.string "simShwStr="
str_simShwIn:
.string "simShwIn="
str_simShwMin:
.string "simShwMin="

str_sRGBMode:
.string "sRGBMode="
str_gamma:
.string "gamma="

str_ao_av_CenterWeight:
.string "ao_av_CenterWeight="
str_ao_av_MaxDistance:
.string "ao_av_MaxDistance="
str_ao_av_MaxRadius:
.string "ao_av_MaxRadius="
str_ao_av_FadeOutStart:
.string "ao_av_FadeOutStart="
str_ao_av_FadeOutDistance:
.string "ao_av_FadeOutDistance="
str_ao_av_BlurFallOff:
.string "ao_av_BlurFallOff="
str_ao_av_BlurScale:
.string "ao_av_BlurScale="
str_ao_av_Shwstr:
.string "ao_av_Shwstr="

str_cam_near:
.string "cam_near="
str_cam_far:
.string "cam_far="

str_avmp01:
.string "avmp01 = "
str_avmp02:
.string "avmp02 = "
str_avmp03:
.string "avmp03 = "
str_avmp04:
.string "avmp04 = "
str_avmp05:
.string "avmp05 = "
str_avmp06:
.string "avmp06 = "
str_avmp07:
.string "avmp07 = "
str_avmp08:
.string "avmp08 = "
str_avmp09:
.string "avmp09 = "
str_avmp10:
.string "avmp10 = "
str_avmp11:
.string "avmp11 = "
str_avmp12:
.string "avmp12 = "
str_avmp13:
.string "avmp13 = "
str_avmp14:
.string "avmp14 = "
str_avmp15:
.string "avmp15 = "
str_avmp16:
.string "avmp16 = "

str_cloud_h_min:
.string "cloud_h_min="
str_cloud_h_max:
.string "cloud_h_max="

;array of pointers to the list of strings above
;will be used to print the associated strings into memory
lookuptable_settingname_INImod:
.uint str_tonemap, str_ssao, str_bloom, str_godray, str_AntiAliasing, str_ColReduction, str_dof, str_lensFlare, str_lut, str_luttex1, str_cube, str_tonemax, str_tonemin, str_tonemul, str_toneLastmul, str_toneBlmmax, str_toneBlmmin, str_toneBlmmul, str_toneBlmLastmul, str_godray_inival, str_godray_decay, str_godray_scale, str_blm_border_sub, str_blm_border_mul, str_blm_border_sub2, str_blm_border_mul2, str_blm_border_max, str_blm_tex_mul, str_blm_blurscale1, str_blm_blurscale2, str_blm_blurscale3, str_blm_blurRange1, str_blm_blurRange2, str_blm_blurRange3, str_blm_scale1, str_blm_scale2, str_blm_scale3, str_lens_max, str_lens_rot, str_lens_sub, str_lens_mul, str_lens_weight, str_lens_decay, str_lens_str, str_lens_paMax, str_lens_UVDecay, str_AA_Sharpness, str_AA_Range, str_AA_Threshold, str_AA_ThresholdMin, str_red_sclX, str_red_sclY, str_red_Auto, str_red_AtMaxX, str_red_AtMaxY, str_red_AtMinX, str_red_AtMinY, str_red_AtRate, str_ao_Lengs, str_ao_LengsRatio, str_ao_range, str_ao_rangeRatio, str_ao_sub, str_ao_subRatio, str_ao_Mul, str_ao_blurRange, str_ao_blurScale, str_blur, str_blurStr, str_blurSub, str_shadowStr, str_shadowHalf, str_simShwStr, str_simShwIn, str_simShwMin, str_sRGBMode, str_gamma, str_ao_av_CenterWeight, str_ao_av_MaxDistance, str_ao_av_MaxRadius, str_ao_av_FadeOutStart, str_ao_av_FadeOutDistance, str_ao_av_BlurFallOff, str_ao_av_BlurScale, str_ao_av_Shwstr, str_cam_near, str_cam_far, str_avmp01, str_avmp02, str_avmp03, str_avmp04, str_avmp05, str_avmp06, str_avmp07, str_avmp08, str_avmp09, str_avmp10, str_avmp11, str_avmp12, str_avmp13, str_avmp14, str_avmp15, str_avmp16, str_cloud_h_min, str_cloud_h_max

;array of short strings that either contain "on" or "off"
;will be used to print the associated setting
lookuptable_onoff_INImod:
.uint $tonemap, $ssao, $bloom, $godray, $AntiAliasing, $ColReduction, $dof, $lensFlare, $lut,   $red_Auto,    $blur,    $shadowHalf,    $sRGBMode

;array of string pointers used to print the luttex1 and cube setting values
lookuptable_stringvalue_INImod:
.uint value_luttex1, value_cube

;array of floats used to print the float for the associated string
lookuptable_float_INImod:
.float $tonemax, $tonemin, $tonemul, $toneLastmul, $toneBlmmax, $toneBlmmin, $toneBlmmul, $toneBlmLastmul, $godray_inival, $godray_decay, $godray_scale, $blm_border_sub, $blm_border_mul, $blm_border_sub2, $blm_border_mul2, $blm_border_max, $blm_tex_mul, $blm_blurscale1, $blm_blurscale2, $blm_blurscale3, $blm_blurRange1, $blm_blurRange2, $blm_blurRange3, $blm_scale1, $blm_scale2, $blm_scale3, $lens_max, $lens_rot, $lens_sub, $lens_mul, $lens_weight, $lens_decay, $lens_str, $lens_paMax, $lens_UVDecay, $AA_Sharpness, $AA_Range, $AA_Threshold, $AA_ThresholdMin, $red_sclX, $red_sclY,    $red_AtMaxX, $red_AtMaxY, $red_AtMinX, $red_AtMinY, $red_AtRate, $ao_Lengs, $ao_LengsRatio, $ao_range, $ao_rangeRatio, $ao_sub, $ao_subRatio, $ao_Mul, $ao_blurRange, $ao_blurScale,    $blurStr, $blurSub, $shadowStr,    $simShwStr, $simShwIn, $simShwMin,    $gamma, $ao_av_CenterWeight, $ao_av_MaxDistance, $ao_av_MaxRadius, $ao_av_FadeOutStart, $ao_av_FadeOutDistance, $ao_av_BlurFallOff, $ao_av_BlurScale, $ao_av_Shwstr, $cam_near, $cam_far, $avmp0101, $avmp0102, $avmp0103, $avmp0201, $avmp0202, $avmp0203, $avmp0301, $avmp0302, $avmp0303, $avmp0401, $avmp0402, $avmp0403, $avmp0501, $avmp0502, $avmp0503, $avmp0601, $avmp0602, $avmp0603, $avmp0701, $avmp0702, $avmp0703, $avmp0801, $avmp0802, $avmp0803, $avmp0901, $avmp0902, $avmp0903, $avmp1001, $avmp1002, $avmp1003, $avmp1101, $avmp1102, $avmp1103, $avmp1201, $avmp1202, $avmp1203, $avmp1301, $avmp1302, $avmp1303, $avmp1401, $avmp1402, $avmp1403, $avmp1501, $avmp1502, $avmp1503, $avmp1601, $avmp1602, $avmp1603, $cloud_h_min, $cloud_h_max

;array of intigers used to set the number of decimal places printed for the associated float
lookuptable_float_precision_INImod:
.byte $tonemax_DecimalPlaces, $tonemin_DecimalPlaces, $tonemul_DecimalPlaces, $toneLastmul_DecimalPlaces, $toneBlmmax_DecimalPlaces, $toneBlmmin_DecimalPlaces, $toneBlmmul_DecimalPlaces, $toneBlmLastmul_DecimalPlaces, $godray_inival_DecimalPlaces, $godray_decay_DecimalPlaces, $godray_scale_DecimalPlaces, $blm_border_sub_DecimalPlaces, $blm_border_mul_DecimalPlaces, $blm_border_sub2_DecimalPlaces, $blm_border_mul2_DecimalPlaces, $blm_border_max_DecimalPlaces, $blm_tex_mul_DecimalPlaces, $blm_blurscale1_DecimalPlaces, $blm_blurscale2_DecimalPlaces, $blm_blurscale3_DecimalPlaces, $blm_blurRange1_DecimalPlaces, $blm_blurRange2_DecimalPlaces, $blm_blurRange3_DecimalPlaces, $blm_scale1_DecimalPlaces, $blm_scale2_DecimalPlaces, $blm_scale3_DecimalPlaces, $lens_max_DecimalPlaces, $lens_rot_DecimalPlaces, $lens_sub_DecimalPlaces, $lens_mul_DecimalPlaces, $lens_weight_DecimalPlaces, $lens_decay_DecimalPlaces, $lens_str_DecimalPlaces, $lens_paMax_DecimalPlaces, $lens_UVDecay_DecimalPlaces, $AA_Sharpness_DecimalPlaces, $AA_Range_DecimalPlaces, $AA_Threshold_DecimalPlaces, $AA_ThresholdMin_DecimalPlaces, $red_sclX_DecimalPlaces, $red_sclY_DecimalPlaces,        $red_AtMaxX_DecimalPlaces, $red_AtMaxY_DecimalPlaces, $red_AtMinX_DecimalPlaces, $red_AtMinY_DecimalPlaces, $red_AtRate_DecimalPlaces, $ao_Lengs_DecimalPlaces, $ao_LengsRatio_DecimalPlaces, $ao_range_DecimalPlaces, $ao_rangeRatio_DecimalPlaces, $ao_sub_DecimalPlaces, $ao_subRatio_DecimalPlaces, $ao_Mul_DecimalPlaces, $ao_blurRange_DecimalPlaces, $ao_blurScale_DecimalPlaces,       $blurStr_DecimalPlaces, $blurSub_DecimalPlaces, $shadowStr_DecimalPlaces,      $simShwStr_DecimalPlaces, $simShwIn_DecimalPlaces, $simShwMin_DecimalPlaces,       $gamma_DecimalPlaces, $ao_av_CenterWeight_DecimalPlaces, $ao_av_MaxDistance_DecimalPlaces, $ao_av_MaxRadius_DecimalPlaces, $ao_av_FadeOutStart_DecimalPlaces, $ao_av_FadeOutDistance_DecimalPlaces, $ao_av_BlurFallOff_DecimalPlaces, $ao_av_BlurScale_DecimalPlaces, $ao_av_Shwstr_DecimalPlaces, $cam_near_DecimalPlaces, $cam_far_DecimalPlaces, $avmp01_DecimalPlaces, $avmp02_DecimalPlaces, $avmp03_DecimalPlaces, $avmp04_DecimalPlaces, $avmp05_DecimalPlaces, $avmp06_DecimalPlaces, $avmp07_DecimalPlaces, $avmp08_DecimalPlaces, $avmp09_DecimalPlaces, $avmp10_DecimalPlaces, $avmp11_DecimalPlaces, $avmp12_DecimalPlaces, $avmp13_DecimalPlaces, $avmp14_DecimalPlaces, $avmp15_DecimalPlaces, $avmp16_DecimalPlaces, $cloud_h_min_DecimalPlaces, $cloud_h_max_DecimalPlaces

;format string that the C function sprintf() needs
;the * will be replaced with a number that sets the number of decimal places
str_floating_precision_INImod:
.string "%.*f"
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
    lbz r24, 1(r30)
    cmpwi r24, 0
    bne+ _whileLoopDeleteINI
blr

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

;function wraper that takes in r20 and a function pointer(r27)
;loops the function by the ammount in r20
PrintSettingsINImod:
mflr r31
_forloopPrintAMVPSettingsINImod:
    bl PrintSettingNameINImod
    mtctr r27
    bctrl
    addic. r20, r20, -1
    bgt+ _forloopPrintAMVPSettingsINImod
mtlr r31
blr

;prints new line character
PrintNewLineINImod:
li r26, 0x0D0A
sth r26, 0(r30)
addi r30, r30, 1
blr

;checks if the floating point precision is less than 0 or greater than 9
;if so set precision to 1 to prevent the game from crashing
CheckifPrecisionIsValidINImod:
cmpwi r3, 0x30+0
bge+ _ifPrecisionLessThan0INImod
    li r3, 0x30+1
_ifPrecisionLessThan0INImod:
cmpwi r3, 0x30+9
ble+ _ifPrecisionGreaterThan9INImod
    li r3, 0x30+1
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
addi r3, r3, 0x30
bl CheckifPrecisionIsValidINImod
stb r3, 2(r4)
or r3, r30, r30
CREQV 4*cr1+eq, 4*cr1+eq, 4*cr1+eq ;required for some reason
mtctr r25
bctrl ;bl sprintf
or r30, r11, r11
mtlr r29
blr

;passes PrintOnOff into the PrintSettings function wraper
PrintOnOffSettingsINImod:
lis r27, PrintOnOffINImod@hi
ori r27, r27, PrintOnOffINImod@l
b PrintSettingsINImod

;takes in r23 and prints either on or off
PrintOnOffINImod:
mflr r28
lwzu r26, 4(r23)
stw r26, 0(r30)
_whileloopPrintOnOffINImod:
    lbzu r26, 1(r30)
    cmpwi r26, 0
    bne+ _whileloopPrintOnOffINImod
bl PrintNewLineINImod
mtlr r28
blr

;passes PrintStringValue into the PrintSettings function wraper
PrintStringValueSettingsINImod:
lis r27, PrintStringValueINImod@hi
ori r27, r27, PrintStringValueINImod@l
b PrintSettingsINImod

;takes in a string pointer(r18), and hijacks PrintSettingName to print it
PrintStringValueINImod:
mflr r28
addi r30, r30, -1
or r19, r22, r22
or r22, r18, r18
bl PrintSettingNameINImod
or r18, r22, r22
or r22, r19, r19
bl PrintNewLineINImod
mtlr r28
blr

;passes PrintFloat into the PrintSettings function wraper
PrintFloatSettingsINImod:
lis r27, PrintFloatINImod@hi
ori r27, r27, PrintFloatINImod@l
b PrintSettingsINImod

;takes in a floating point(r24), and its precision(r21)
;calls sprintf to print the float
PrintFloatINImod:
mflr r28
lbzu r3, 1(r21)
bl CallsprintfINImod
bl PrintNewLineINImod
mtlr r28
blr

;passes PrintAMVP into the PrintSettings function wraper
PrintAMVPSettingsINImod:
lis r27, PrintAMVPINImod@hi
ori r27, r27, PrintAMVPINImod@l
b PrintSettingsINImod

;prints 3 floats sperated by a comma
PrintAMVPINImod:
mflr r28
lis r19, 0x202C
ori r19, r19, 0x2000
lbzu r3, 1(r21)
bl CallsprintfINImod
stw r19, 0(r11)
addi r30, r30, 3
lbz r3, 0(r21)
bl CallsprintfINImod
stw r19, 0(r11)
addi r30, r30, 3
lbz r3, 0(r21)
bl CallsprintfINImod
bl PrintNewLineINImod
mtlr r28
blr

; r22 == 0x23f09100
;Free registers that do not need to be restored:
; r25 r24 r28 r10
_EditINIforinimod:
;back up registers r0-r31
lis r10, ini_register_backup@ha
stmw r0, ini_register_backup@l(r10)
;back up link register
mflr r24
lis r10, ini_linkregister_backup@ha
stw r24, ini_linkregister_backup@l(r10)
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
;print extra new line character
;li r26, 0x0D0A
sth r26, 1(r30)

_ExitEditINImod:
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



_SprintfFunctionAddress_V101E_ini:
;load the function pointer for the C function sprintf() into r25
lis r25, 0x03B1
ori r25, r25, 0x8118
b _EditINIforinimod

_SprintfFunctionAddress_V102U_ini:
;load the function pointer for the C function sprintf() into r25
lis r25, 0x03B1
ori r25, r25, 0x8098
b _EditINIforinimod

_SprintfFunctionAddress_V102J_ini:
;load the function pointer for the C function sprintf() into r25
lis r25, 0x03B1
ori r25, r25, 0x34B0
b _EditINIforinimod

_SprintfFunctionAddress_V100U_ini:
;load the function pointer for the C function sprintf() into r25
lis r25, 0x03B1
ori r25, r25, 0x7F18
b _EditINIforinimod

_SprintfFunctionAddress_V100J_ini:
;load the function pointer for the C function sprintf() into r25
lis r25, 0x03B0
ori r25, r25, 0xDEB0
b _EditINIforinimod

[XCX_libini_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
;patches the address with a branch link to the mod
0x02FF94C8 = bla _SprintfFunctionAddress_V101E_ini

[XCX_libini_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
;patches the address with a branch link to the mod
0x02FF9468 = bla _SprintfFunctionAddress_V102U_ini

[XCX_libini_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
;patches the address with a branch link to the mod
0x02FF4990 = bla _SprintfFunctionAddress_V102J_ini

[XCX_libini_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
;patches the address with a branch link to the mod
0x02FF92F0 = bla _SprintfFunctionAddress_V100U_ini

[XCX_libini_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
;patches the address with a branch link to the mod
0x02FEF588 = bla _SprintfFunctionAddress_V100J_ini
