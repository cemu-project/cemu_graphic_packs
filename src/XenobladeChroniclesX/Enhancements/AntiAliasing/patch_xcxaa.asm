[XCX_AntiAliasing]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

str_AntiAliasing:         ;= ;0x3D
.string "AntiAliasing="   ;0x416E7469416C696173696E673D        ;41 6E 74 69 41 6C 69 61 73 69 6E 67 3D
str_AA_Sharpness:
.string "AA_Sharpness="   ;0x41415F53686172706E6573733D        ;41 41 5F 53 68 61 72 70 6E 65 73 73 3D
str_AA_Range:
.string "AA_Range="       ;0x41415F52616E67653D                ;41 41 5F 52 61 6E 67 65 3D
str_AA_Threshold:
.string "AA_Threshold="   ;0x41415F5468726573686F6C643D        ;41 41 5F 54 68 72 65 73 68 6F 6C 64 3D
str_AA_ThresholdMin:
.string "AA_ThresholdMin=";0x41415F5468726573686F6C644D696E3D  ;41 41 5F 54 68 72 65 73 68 6F 6C 64 4D 69 6E 3D

str_AA_floating_precision:
.string "%.*f"

AAEnable:
.uint $AAEnable
AASharpness:
.float $AASharpness
AARange:
.float $AARange
AAThreshold:
.float $AAThreshold
AAThresholdMin:
.float $AAThresholdMin

; r22 == 0x23f0a100
;Free registers that do not need to be restored:
; r26 r25 r24 r28 r10

;creates a copy of the ini file so we can fix it after we edit it
_makeCopyofINIAA:
addi r10, r22, 0x1200-4
li r24, 0x1F2
_forLoopMakeCopyofINIAA:
 lwz r28, -0x1200+4(r10)
 stwu r28, 4(r10)
 addic. r24, r24, -1
 bne+ _forLoopMakeCopyofINIAA
blr

;reads the file to check for setting string
;gets the ram address of where the setting starts (r10)
_CheckForINIAASetting:
or r26, r25, r25
addi r10, r22, -1
_whileLoopSearchSettingAA:
  lbzu r28, 1(r10)
  lbz  r24, 0(r25)
  cmpwi r28, 0 ;if this activates the setting was not found
  beq- _ExitEditINIforAAmod
  cmpw r28, r24
  beq- _Equal_SettingSearchAA
  or r25, r26, r26
  b _whileLoopSearchSettingAA
_Equal_SettingSearchAA:
  lbzu  r24, 1(r25)
  cmpwi r24, 0 ;every string ends with a null byte
  bne+ _whileLoopSearchSettingAA
stw r10, 0x1200+0x800+40(r22)

;gets the ram address of where the setting ends (r24)
_CheckForEndofSettingAA:
addi r24, r10, 0x1200
_whileLoop_FindEndOfSettingAA_0D:
 lbzu r28, 1(r24)
 cmpwi r28, 0x0D
 bne+ _whileLoop_FindEndOfSettingAA_0D
_whileLoop_FindEndOfSettingAA_0A:
 lbzu r28, 1(r24)
 cmpwi r28, 0x0A
 bne- _whileLoop_FindEndOfSettingAA_0D
blr

;copies the trailing part of the ini file copy back to the real ini file
_ChangeAntiAliasingSettingINIMod:
lwz r10, 0x1200+0x800+40(r22)
_whileLoopCheckAASettingLength:
 lbzu r26, 1(r10)
 cmpwi r26, 0
 bne+ _whileLoopCheckAASettingLength
subi r24, r24, 4+1
subi r10, r10, 4
_whileLoopCopyINIAAModBackIn:
 lwzu r26, 4(r24)
 stwu r26, 4(r10)
 andi. r25, r26, 0xFF
 bne+ _whileLoopCopyINIAAModBackIn
blr

;deletes the copy of the ini file we made as to not mess with the games ram
_DeleteINIAACopy:
addi r10, r22, 0x1200-4
li r28, 0
_whileLoopDeleteINIAACopy:
 stwu r28, 4(r10)
 lwz r24, 4(r10)
 cmpwi r24, 0
 bne+ _whileLoopDeleteINIAACopy
blr



_EditINIforAAmod:
;back up link register
mflr r26
stw r26, 0x1200+0x800+128(r22)
;AntiAliasing enable Setting ---------------------------------------------------------
_ChangeAAEnabledSettingINIMod:
bl _makeCopyofINIAA

;check for AntiAliasing=
;Load address of the "AntiAliasing=" string
lis r25, str_AntiAliasing@ha
ori r25, r25, str_AntiAliasing@l
;gets the ram address of where the setting starts and ends (starts r10, ends r24)
bl _CheckForINIAASetting

;loads the user preset AA enable setting and puts it into memory
lis r28, AAEnable@ha
lwz r28, AAEnable@l(r28)
stw r28, 1(r10)
;makes sure there is a null byte
li r26, 0
stb r26, 5(r10)
;fixes ini file after we mess it up
bl _whileLoopCheckAASettingLength

;checks if AA setting is set to native and if not exits the mod
_CheckifNativeAA:
li r25, $Preset
cmpwi r25, 1
bne _ExitEditINIforAAmod


;AA_Sharpness Setting ---------------------------------------------------------
_ChangeAASharpnessSettingINIMod:
;deletes our copy of the file and then recopies the file
;this is done because I don't feel like finding a better way of updating the file
bl _DeleteINIAACopy
bl _makeCopyofINIAA

;check for AA_Sharpness=
lis r25, str_AA_Sharpness@ha
ori r25, r25, str_AA_Sharpness@l
;gets the ram address of where the setting starts and ends (starts r10, ends r24)
bl _CheckForINIAASetting

;loads arguments for sprintf into r3, r4, and f1
lis  r3, AASharpness@ha
lfs  f1, AASharpness@l(r3)
addi r3, r10, 1
lis r4, str_AA_floating_precision@ha
ori r4, r4, str_AA_floating_precision@l
;updated the format string with the user specified decimal precision
li r25, 0x30+$AASharpnessDecimalPlaces
stb r25, 2(r4)
;sets condition register and branches to sprintf to convert the float in f1 to a string
;at the memory address in r3, using the string format pointed to by r4
CREQV 4*cr1+eq, 4*cr1+eq, 4*cr1+eq
mtctr r29 ;bl sprintf
bctrl

bl _ChangeAntiAliasingSettingINIMod

;AA_Range Setting ---------------------------------------------------------
_ChangeAARangeSettingINIMod:
bl _DeleteINIAACopy
bl _makeCopyofINIAA

lis r25, str_AA_Range@ha
ori r25, r25, str_AA_Range@l
bl _CheckForINIAASetting

lis  r3, AARange@ha
lfs  f1, AARange@l(r3)
addi r3, r10, 1
lis r4, str_AA_floating_precision@ha
ori r4, r4, str_AA_floating_precision@l
li r25, 0x30+$AARangeDecimalPlaces
stb r25, 2(r4)
CREQV 4*cr1+eq, 4*cr1+eq, 4*cr1+eq
mtctr r29 ;bl sprintf
bctrl

bl _ChangeAntiAliasingSettingINIMod

;AA_Threshold Setting ---------------------------------------------------------
_ChangeAAThresholdSettingINIMod:
bl _DeleteINIAACopy
bl _makeCopyofINIAA

lis r25, str_AA_Threshold@ha
ori r25, r25, str_AA_Threshold@l
bl _CheckForINIAASetting

lis  r3, AAThreshold@ha
lfs  f1, AAThreshold@l(r3)
addi r3, r10, 1
lis r4, str_AA_floating_precision@ha
ori r4, r4, str_AA_floating_precision@l
li r25, 0x30+$AAThresholdDecimalPlaces
stb r25, 2(r4)
CREQV 4*cr1+eq, 4*cr1+eq, 4*cr1+eq
mtctr r29 ;bl sprintf
bctrl

bl _ChangeAntiAliasingSettingINIMod

;AA_ThresholdMin Setting ---------------------------------------------------------
_ChangeAAThresholdMINSettingINIMod:
bl _DeleteINIAACopy
bl _makeCopyofINIAA

lis r25, str_AA_ThresholdMin@ha
ori r25, r25, str_AA_ThresholdMin@l
bl _CheckForINIAASetting

lis  r3, AAThresholdMin@ha
lfs  f1, AAThresholdMin@l(r3)
addi r3, r10, 1
lis r4, str_AA_floating_precision@ha
ori r4, r4, str_AA_floating_precision@l
li r25, 0x30+$AAThresholdMinDecimalPlaces
stb r25, 2(r4)
CREQV 4*cr1+eq, 4*cr1+eq, 4*cr1+eq
mtctr r29 ;bl sprintf
bctrl

bl _ChangeAntiAliasingSettingINIMod


;restores the game to how it was before the mod and exits the mod
_ExitEditINIforAAmod:
;delets the back up of the lib.ini file that we made to edit the original
bl _DeleteINIAACopy
;restore registers
lwz r25, 0x1200+0x800+128(r22)
mtlr r25
lmw r0, 0x1200+0x800(r22)
;delete register backup
li r28, 0
addi r26, r22, 0x1200+0x800-4
li r25, (128+4)/4
mtctr r25
_forloopClearRegistersAA:
 stwu r28, 4(r26)
 bdnz _forloopClearRegistersAA

;restores line we over wrote and returns to the game
;lwz r22, 0xa0(r31)
lis r26, 0x101c
blr


[XCX_AntiAliasing_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
.origin = codecave
_SprintfFunctionAddress_V101E_AA:
stmw r0, 0x1200+0x800(r22) ;backs up current registers
lis r29, 0x03B1
ori r29, r29, 0x8118 ;sprintf
b _EditINIforAAmod

0x02FF94C4 = bla _SprintfFunctionAddress_V101E_AA


[XCX_AntiAliasing_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
.origin = codecave
_SprintfFunctionAddress_V102U_AA:
stmw r0, 0x1200+0x800(r22) ;backs up current registers
lis r29, 0x03B1
ori r29, r29, 0x8098 ;sprintf
b _EditINIforAAmod

0x02FF9464 = bla _SprintfFunctionAddress_V102U_AA


[XCX_AntiAliasing_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
.origin = codecave
_SprintfFunctionAddress_V102J_AA:
stmw r0, 0x1200+0x800(r22)
lis r29, 0x03B1
ori r29, r29, 0x34B0 ;sprintf
b _EditINIforAAmod

0x02FF498C = bla _SprintfFunctionAddress_V102J_AA


[XCX_AntiAliasing_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
.origin = codecave
_SprintfFunctionAddress_V100U_AA:
stmw r0, 0x1200+0x800(r22)
lis r29, 0x03B1
ori r29, r29, 0x7F18 ;sprintf
b _EditINIforAAmod

0x02FF92EC = bla _SprintfFunctionAddress_V100U_AA


[XCX_AntiAliasing_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
.origin = codecave
_SprintfFunctionAddress_V100J_AA:
stmw r0, 0x1200+0x800(r22)
lis r29, 0x03B0
ori r29, r29, 0xDEB0 ;sprintf
b _EditINIforAAmod

0x02FEF584 = bla _SprintfFunctionAddress_V100J_AA
