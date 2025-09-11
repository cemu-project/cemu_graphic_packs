[TPHDv81]
moduleMatches = 0x1A03E108, 0xA3175EEA

.origin = codecave

;########### variable setup
_controlleraddy:
.int $controller

_moonjumpBtnCombo:
.int $moon_jmp_btn_combo

_gravity:
.float $gravity

_heartdecmult:
.float $heart_dec_mult

_climbspeed:
.float $climb_speed

_climbfast:
.byte $climb_fast

_rupmult:
.byte $rup_mult

_rupinc:
.byte $rup_inc

_heartdec:
.byte $heart_dec

_arrowdec:
.byte $arrow_dec

_bombdec:
.byte $bomb_dec

_oildec:
.byte $oil_dec

_seeddec:
.byte $seed_dec

;###########


;########### asm modifications


;########### rupee multiplier and rupees always increase
rupeelogic:
    lwz r12, +0x6280(r31)
    lis r4, _rupmult@ha
    lbz r16, _rupmult@l(r4)
    lbz r4, _rupinc@l(r4)
    cmpwi r12, 0
    bge handle_multiply
handle_spend:
    cmpwi r4, 1
    bne rupreturn
    li r17, 0
    sub r12, r17, r12
    b handle_multiply
handle_multiply:
    cmpwi r16, 2
    blt rupreturn
    mullw r12, r12, r16
rupreturn:
    blr

;###########


;########### health never decreases and damage taken multiplier
healthdeclogic:
lis r14, _heartdec@ha
lbz r15, _heartdec@l(r14)


checkhealthdec:
cmpwi r15, 1
fsub f26, f26, f26
fcmpu cr1, f8, f26
bgt cr1, healthdecreturn
beq nohealthdec
lfs f26, _heartdecmult@l(r14)
fmul f8, f26, f8
b healthdecreturn

nohealthdec:
fsub f8, f8, f8

healthdecreturn:
fadds f9, f9, f8
blr

;###########

;########### arrows never decrease logic
arrowlogic:
lis r21, _arrowdec@ha
lbz r22, _arrowdec@l(r21)
cmpwi cr1, r22,0
beq cr1, arrowreturn
cmpwi cr1, r11, 0
bgt cr1, arrowreturn
xor r11, r11, r11

arrowreturn:
add r7, r10, r11
blr

;###########

;########### bombs never decrease logic
bomblogic:
lis r14, _bombdec@ha
lbz r15, _bombdec@l(r14)
cmpwi cr1, r15, 0
beq cr1, bombreturn
lbz r15, +0x1(r12)
cmpw cr1, r15, r5
blt cr1, bombreturn
mr r5,r15

bombreturn:
stb r5,+0x1(r12)
blr

;###########

;########### bombs never decrease logic
oillogic:
lis r14, _oildec@ha
lbz r15, _oildec@l(r14)
cmpwi cr1, r15, 0
beq cr1, oilreturn
mr r5,r0

oilreturn:
sth r5, +0xA(r30)
blr

;###########

;########### bombs never decrease logic
seedlogic:
lis r14, _seeddec@ha
lbz r15, _seeddec@l(r14)
cmpwi cr1, r15, 0
beq cr1, seedreturn
lbz r15, +0xf4(r8)
cmpw cr1, r15, r5
blt cr1, seedreturn
mr r5,r15

seedreturn:
stb r5, +0xf4(r8)
blr

;###########

;########### moonjump logic
moonjumplogic:
lis r17, _gravity@ha
lfs f20, _gravity@l(r17)
fsub f19, f19, f19
fcmpu f20, f19
beq moonreturn
lwz r18, _controlleraddy@l(r17)
lhz r18, +0x02(r18)
lwz r17, _moonjumpBtnCombo@l(r17)
cmpw r18, r17
bne moonreturn
fmr f7, f20

moonreturn:
stfs f7, +0x4fc(r28)
blr

;###########


;########### climb fast logic
climblogic:
lis r14, _climbfast@ha
lbz r15, _climbfast@l(r14)
cmpwi r15, 0
beq originalclimb
lfs f13, _climbspeed@l(r14)
b climbreturn

originalclimb:
lfs f13, +0x728c(r12)

climbreturn:
fmuls f1, f12, f13
blr

;###########

;########### crawl fast logic
crawllogic:
lis r14, _climbfast@ha
lbz r15, _climbfast@l(r14)
cmpwi r15, 0
beq originalcrawl
lfs f0, _climbspeed@l(r14)
b crawlreturn

originalcrawl:
lfs f0, +0x728c(r12)

crawlreturn:
fmadds f1, f0, f12, f13
blr

;###########


;########### Hooks
0x02A1DB74 = bla rupeelogic
0x02A1C664 = bla healthdeclogic
0x02A22734 = bla arrowlogic
0x02AA6764 = ba bomblogic
0x02A1CBD0 = bla oillogic
0x02A22C00 = bla seedlogic
0x02071db8 = bla moonjumplogic
0x0203f5d0 = ba climblogic
0x020a8ed8 = ba climblogic
0x020a6650 = ba climblogic
0x0205367c = ba crawllogic
0x0204d1d4 = .int $roll_asm

0x0203ac14 = .int $always_spin1
0x0203ac24 = .int $always_spin2
0x1000790C = .float $roll_speed
0x1002C076 = .short $drop1
0x1002C078 = .short $drop2
