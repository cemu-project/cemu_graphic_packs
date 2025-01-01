[XCX_BootWithTP_Features]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
;currently missing features:
;a way to ignore max hp / max tp
;a way to fix your character health being shown on screen after battle if continously below its max
;a way to detect if the slip heal function is currently appling to a human or skell


;This function is the exact same as 0x021D50F4 = nop
;the extra code is needed to make the cheat only apply when the apropriate option is selected in the rules.txt
;prevents skells from losing 50 GP/sec while out of them
StopSkellLosingGP:
li r4, $disableSkellLosingGP
cmpwi r4, 0
beq _StopSkellLosingGPExit
mflr r4
addi r4, r4, 8
mtlr r4
blr
_StopSkellLosingGPExit:
lwz r3, 0x24(r30)
blr

;no healing is the exact same as 0x021764F4 = blr
;prevents RegistDamage::HealHide::DamageSystem::HandleKey from ever being called
;the extra code is needed to make the dont update TP option work
;stops out of battle heals, and can also stop TP udating from out of battle heals in the sync settings
DontUpdateHP:
li r11, $afterbattleheal
cmpwi r11, 0
bne _DontUpdateHPExit
mtlr r0
blr
_DontUpdateHPExit:
li r11, $afterbattlerestoretp
cmpwi r11, 0
bne _SkipDontUpdateTPslip
lis r9, CurrentSlipHealPosition@ha
lwz r11, CurrentSlipHealPosition@l(r9)
addi r11, r11, 1
cmpwi r11, 8
blt+ _CheckIFCountTooHigh
li r11, 0
_CheckIFCountTooHigh:
stw r11, CurrentSlipHealPosition@l(r9)
_SkipDontUpdateTPslip:
or r11, r1, r1
blr

[XCX_BootWithTP_Features_v101E_v102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;prevents skells from losing 50 GP/sec while out of them
0x021D50EC = bla StopSkellLosingGP
;stops out of battle heals
0x021764F8 = bla DontUpdateHP

[XCX_BootWithTP_Features_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x021D4BB8 = bla StopSkellLosingGP
0x02175FC4 = bla DontUpdateHP

[XCX_BootWithTP_Features_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x021D50EC = bla StopSkellLosingGP
0x021764F8 = bla DontUpdateHP

[XCX_BootWithTP_Features_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x021D4934 = bla StopSkellLosingGP
0x02175D40 = bla DontUpdateHP
