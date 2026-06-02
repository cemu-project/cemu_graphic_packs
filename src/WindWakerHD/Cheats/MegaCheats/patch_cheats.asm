[MegaCheatsShared]
moduleMatches = 0x475BD29F,0xB7E748DE

.origin = codecave

;output: r18 = controller address
getcontrolleraddress:
    lis r18, _controlleroffset@hi
    ori r18, r18, _controlleroffset@lo
    lwz r18, +0x00(r18)
    addi r18, r18, 0x124
    blr

;output: r18 = boat xyz/facing address, or 0 if boat is not instantiated
getboatxyz:
    lis r18, _boatXYZ@hi
    ori r18, r18, _boatXYZ@lo
    lwz r18, +0x00(r18)
    cmpwi cr1, r18, 0
    beq cr1, getboatxyzfinish
    addi r18, r18, 0x314

getboatxyzfinish:
    blr

_gravity:
    .float $gravity

_sailSpeed:
    .float $sailSpeed

_linkSwimSpeed:
    .float $linkSwimSpeed

_boatTeleportYOffset:
    .float 50.0

_rupeeMultiplier:
    .int $rupeeMultiplier

;keep this 4-byte aligned since every PPC instruction is 4-bytes long
_rupeesNeverDecrease:
    .byte $rupeesNeverDecrease
    .align 2

_infiniteHearts:
    .byte $infiniteHearts
    .align 2

_linkDamageMultiplier:
    .byte $linkDamageMultiplier
    .align 2

_linkDamageGivenMultiplier:
    .float $linkDamageGivenMultiplier

    .align 3
_intToFloatMagic:
    .int 0x43300000
    .int 0x80000000

_infiniteMagic:
    .byte $infiniteMagic
    .align 2

_infiniteBombs:
    .byte $infiniteBombs
    .align 2

_infiniteArrows:
    .byte $infiniteArrows
    .align 2

_invincibility:
    .byte $invincibility
    .align 2

_remoteBombs:
    .byte $remoteBombs
    .align 2

_allowButtonCombos:
    .byte 1
    .align 2

_saveLoadCoords:
    .byte $saveLoadCoords
    .align 2

_teleportToBoat:
    .byte $teleportToBoat
    .align 2

_windDirection:
    .byte $windDirection
    .align 2

_buttonExactOnly:
    .byte 0
    .align 2

_coordsSaved:
    .byte 0
    .align 2

_savedX:
    .int 0

_savedY:
    .int 0

_savedZ:
    .int 0

_savedDirection:
    .short 0
    .align 2

_savedRoomName:
    .int 0
    .int 0

;copies the current room name into _savedRoomName
copycurrentroomname:
    lis r16, _savedRoomName@ha
    addi r16, r16, _savedRoomName@l
    lis r17, _currentRoom@ha
    addi r17, r17, _currentRoom@l
    li r20, 8

copycurrentroomloop:
    lbz r18, +0x00(r17)
    stb r18, +0x00(r16)
    cmpwi cr1, r18, 0
    beq cr1, copycurrentroomfinish
    addi r16, r16, 1
    addi r17, r17, 1
    addi r20, r20, -1
    cmpwi cr1, r20, 0
    bne cr1, copycurrentroomloop

copycurrentroomfinish:
    blr

;output: r17 = 1 if current room matches saved room, 0 if not
currentroommatches:
    lis r16, _savedRoomName@ha
    addi r16, r16, _savedRoomName@l
    lis r17, _currentRoom@ha
    addi r17, r17, _currentRoom@l
    li r20, 8

currentroommatchloop:
    lbz r18, +0x00(r17)
    lbz r19, +0x00(r16)
    cmpw cr1, r18, r19
    bne cr1, currentroomnomatch
    cmpwi cr1, r18, 0
    beq cr1, currentroommatch
    addi r16, r16, 1
    addi r17, r17, 1
    addi r20, r20, -1
    cmpwi cr1, r20, 0
    bne cr1, currentroommatchloop

currentroommatch:
    li r17, 1
    blr

currentroomnomatch:
    li r17, 0
    blr

;output: r17 = 1 if current room is "sea", 0 if not
currentroomissea:
    lis r16, _currentRoom@ha
    addi r16, r16, _currentRoom@l
    lbz r17, +0x00(r16)
    cmpwi cr1, r17, 0x73 ;s
    bne cr1, currentroomisnotsea
    lbz r17, +0x01(r16)
    cmpwi cr1, r17, 0x65 ;e
    bne cr1, currentroomisnotsea
    lbz r17, +0x02(r16)
    cmpwi cr1, r17, 0x61 ;a
    bne cr1, currentroomisnotsea
    lbz r17, +0x03(r16)
    cmpwi cr1, r17, 0
    bne cr1, currentroomisnotsea
    li r17, 1
    blr

currentroomisnotsea:
    li r17, 0
    blr

;input: r16 = button mask, r17 = allow other pressed buttons
;output: r17 = 1 if detected, 0 if not detected
buttonpressedlogic:
    stwu r1, -0x20(r1)
    stw r18, +0x08(r1)
    stw r19, +0x0C(r1)
    mflr r18
    stw r18, +0x10(r1)

    bl getcontrolleraddress
    lwz r19, +0x00(r18)
    cmpwi cr1, r17, 0
    beq cr1, buttonexact

    and r18, r19, r16
    cmpw cr1, r18, r16
    beq cr1, buttonpressed
    b buttonnotpressed

buttonexact:
    cmpw cr1, r19, r16
    beq cr1, buttonpressed

buttonnotpressed:
    li r17, 0
    b buttonfinish

buttonpressed:
    li r17, 1

buttonfinish:
    lwz r18, +0x10(r1)
    mtlr r18
    lwz r18, +0x08(r1)
    lwz r19, +0x0C(r1)
    addi r1, r1, 0x20
    blr

moonjumplogic:
    stwu r1, -0x20(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)
    stw r18, +0x10(r1)
    mflr r18
    stw r18, +0x14(r1)

    lis r16, _gravity@ha
    lfs f0, _gravity@l(r16)
    fsub f1, f1, f1
    fcmpu cr1, f0, f1
    beq cr1, moonreturn
    li r16, 0x80 ;left-stick click
    lis r17, _allowButtonCombos@ha
    lbz r17, _allowButtonCombos@l(r17)
    bl buttonpressedlogic
    cmpwi cr1, r17, 1
    bne cr1, moonreturn
    fmr f11, f0

moonreturn:
    lwz r18, +0x14(r1)
    mtlr r18
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    lwz r18, +0x10(r1)
    addi r1, r1, 0x20
    stfs f11, +0x340(r28)
    blr

sailspeedlogic:
    stwu r1, -0x20(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)
    stw r18, +0x10(r1)
    mflr r18
    stw r18, +0x14(r1)

    li r16, 0x01 ;A button
    lis r17, _allowButtonCombos@ha
    lbz r17, _allowButtonCombos@l(r17)
    bl buttonpressedlogic
    cmpwi cr1, r17, 1
    bne cr1, sailreturn
    lis r16, _sailSpeed@ha
    lfs f31, _sailSpeed@l(r16)
    b sailfinish

sailreturn:
    lfs f31, -0x58f8(r8)

sailfinish:
    lwz r18, +0x14(r1)
    mtlr r18
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    lwz r18, +0x10(r1)
    addi r1, r1, 0x20
    blr

linkswimspeedlogic:
    stwu r1, -0x20(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)
    stw r18, +0x10(r1)
    mflr r18
    stw r18, +0x14(r1)

    li r16, 0x01 ;A button
    lis r17, _allowButtonCombos@ha
    lbz r17, _allowButtonCombos@l(r17)
    bl buttonpressedlogic
    cmpwi cr1, r17, 1
    bne cr1, linkswimreturn
    lis r16, _linkSwimSpeed@ha
    lfs f31, _linkSwimSpeed@l(r16)
    b linkswimfinish

linkswimreturn:
    lfs f31, +0x5638(r12)

linkswimfinish:
    lwz r18, +0x14(r1)
    mtlr r18
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    lwz r18, +0x10(r1)
    addi r1, r1, 0x20
    blr

linkdamagegivenlogic:
    lbz r12, +0x08(r28)
    cmpwi cr1, r12, 0
    beq cr1, linkdamagegivenreturn
    stwu r1, -0x20(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)

    lis r16, _linkDamageGivenMultiplier@ha
    lwz r16, _linkDamageGivenMultiplier@l(r16)
    lis r17, 0x3F80
    cmpw cr1, r16, r17
    beq cr1, linkdamagegivenfinish

    xoris r16, r12, 0x8000
    lis r17, 0x4330
    stw r17, +0x10(r1)
    stw r16, +0x14(r1)
    lfd f14, +0x10(r1)
    lis r16, _intToFloatMagic@ha
    lfd f15, _intToFloatMagic@l(r16)
    fsubs f14, f14, f15

    lis r16, _linkDamageGivenMultiplier@ha
    lfs f15, _linkDamageGivenMultiplier@l(r16)
    fmuls f14, f14, f15
    fctiwz f14, f14
    stfd f14, +0x10(r1)
    lwz r12, +0x14(r1)

    cmpwi cr1, r12, 1
    bge cr1, linkdamagecapmax
    li r12, 1
    b linkdamagegivenfinish

linkdamagecapmax:
    cmpwi cr1, r12, 255
    ble cr1, linkdamagegivenfinish
    li r12, 255

linkdamagegivenfinish:
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    addi r1, r1, 0x20
linkdamagegivenreturn:
    blr

winddirectionlogic:
    stwu r1, -0x30(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)
    stw r18, +0x10(r1)
    stw r19, +0x14(r1)
    stw r20, +0x18(r1)
    mflr r18
    stw r18, +0x1C(r1)

    lis r16, _windDirection@ha
    lbz r17, _windDirection@l(r16)
    cmpwi cr1, r17, 1
    beq cr1, windauto
    b windfinish

windauto:
    lis r16, _linkFacingAddress@ha
    lhz r17, _linkFacingAddress@l(r16)
    rlwinm r17, r17, 20, 28, 31
    cmpwi cr1, r17, 1
    blt cr1, setwindsouth
    cmpwi cr1, r17, 3
    blt cr1, setwindsoutheast
    cmpwi cr1, r17, 5
    blt cr1, setwindeast
    cmpwi cr1, r17, 7
    blt cr1, setwindnortheast
    cmpwi cr1, r17, 9
    blt cr1, setwindnorth
    cmpwi cr1, r17, 11
    blt cr1, setwindnorthwest
    cmpwi cr1, r17, 13
    blt cr1, setwindwest
    cmpwi cr1, r17, 15
    blt cr1, setwindsouthwest
    b setwindsouth

setwindeast:
    li r0, 0
    b windfinish

setwindsoutheast:
    li r0, 0
    ori r0, r0, 0x2000
    b windfinish

setwindsouth:
    li r0, 0
    ori r0, r0, 0x4000
    b windfinish

setwindsouthwest:
    li r0, 0
    ori r0, r0, 0x6000
    b windfinish

setwindwest:
    li r0, 0
    ori r0, r0, 0x8000
    b windfinish

setwindnorthwest:
    li r0, 0
    ori r0, r0, 0xA000
    b windfinish

setwindnorth:
    li r0, 0
    ori r0, r0, 0xC000
    b windfinish

setwindnortheast:
    li r0, 0
    ori r0, r0, 0xE000
    b windfinish

saveloadcoordslogic:
    stwu r1, -0x30(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)
    stw r18, +0x10(r1)
    stw r19, +0x14(r1)
    stw r20, +0x18(r1)
    mflr r18
    stw r18, +0x1C(r1)

    lis r16, _freezeState@ha
    lbz r17, _freezeState@l(r16)
    cmpwi cr1, r17, 0
    bne cr1, coordfinish

    lis r16, _teleportToBoat@ha
    lbz r17, _teleportToBoat@l(r16)
    cmpwi cr1, r17, 1
    bne cr1, checksaveLoadCoords
    lis r16, 0x0002 ;D-Pad Down + L + A
    ori r16, r16, 0x2001
    lis r17, _buttonExactOnly@ha
    lbz r17, _buttonExactOnly@l(r17)
    bl buttonpressedlogic
    cmpwi cr1, r17, 1
    beq cr1, teleporttoboat

checksaveLoadCoords:
    lis r16, _saveLoadCoords@ha
    lbz r17, _saveLoadCoords@l(r16)
    cmpwi cr1, r17, 1
    bne cr1, coordfinish

    lis r16, 0x0004 ;D-Pad Left + A
    ori r16, r16, 0x0001
    lis r17, _buttonExactOnly@ha
    lbz r17, _buttonExactOnly@l(r17)
    bl buttonpressedlogic
    cmpwi cr1, r17, 1
    beq cr1, savecoords

    lis r16, 0x0008 ;D-Pad Right + A
    ori r16, r16, 0x0001
    lis r17, _buttonExactOnly@ha
    lbz r17, _buttonExactOnly@l(r17)
    bl buttonpressedlogic
    cmpwi cr1, r17, 1
    beq cr1, loadcoords
    b coordfinish

savecoords:
    lis r16, _savedX@ha
    addi r16, r16, _savedX@l
    lwz r17, +0x00(r28)
    stw r17, +0x00(r16)
    lwz r17, +0x04(r28)
    stw r17, +0x04(r16)
    lwz r17, +0x08(r28)
    stw r17, +0x08(r16)
    lhz r17, -0x36(r28)
    sth r17, +0x0C(r16)
    bl copycurrentroomname
    lis r16, _coordsSaved@ha
    li r17, 1
    stb r17, _coordsSaved@l(r16)
    b coordfinish

loadcoords:
    lis r16, _coordsSaved@ha
    lbz r17, _coordsSaved@l(r16)
    cmpwi cr1, r17, 1
    bne cr1, coordfinish
    bl currentroommatches
    cmpwi cr1, r17, 1
    bne cr1, coordfinish
    lis r16, _savedX@ha
    addi r16, r16, _savedX@l
    lwz r17, +0x00(r16)
    stw r17, +0x00(r28)
    stw r17, +0x314(r31)
    lwz r17, +0x04(r16)
    stw r17, +0x04(r28)
    stw r17, +0x318(r31)
    lwz r17, +0x08(r16)
    stw r17, +0x08(r28)
    stw r17, +0x31C(r31)
    lhz r17, +0x0C(r16)
    sth r17, -0x36(r28)
    b coordfinish

teleporttoboat:
    bl currentroomissea
    cmpwi cr1, r17, 1
    bne cr1, coordfinish
    bl getboatxyz
    cmpwi cr1, r18, 0
    beq cr1, coordfinish

    stfd f0, +0x20(r1)
    stfd f1, +0x28(r1)
    lwz r17, +0x00(r18)
    stw r17, +0x00(r28)
    stw r17, +0x314(r31)
    lfs f0, +0x04(r18)
    lis r16, _boatTeleportYOffset@ha
    lfs f1, _boatTeleportYOffset@l(r16)
    fadds f0, f0, f1
    stfs f0, +0x04(r28)
    stfs f0, +0x318(r31)
    lwz r17, +0x08(r18)
    stw r17, +0x08(r28)
    stw r17, +0x31C(r31)
    lhz r17, +0x0C(r18)
    sth r17, -0x36(r28)
    lfd f0, +0x20(r1)
    lfd f1, +0x28(r1)

coordfinish:
    li r3, 1
    lwz r18, +0x1C(r1)
    mtlr r18
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    lwz r18, +0x10(r1)
    lwz r19, +0x14(r1)
    lwz r20, +0x18(r1)
    addi r1, r1, 0x30
    blr

rupeelogic:
    stwu r1, -0x10(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)

    lis r16, _rupeesNeverDecrease@ha
    lbz r17, _rupeesNeverDecrease@l(r16)
    cmpwi cr1, r17, 0
    beq cr1, rupeeapplymult
    cmpwi cr1, r12, 0
    bge cr1, rupeeapplymult
    li r12, 0
    b rupeefinish

rupeeapplymult:
    cmpwi cr1, r12, 0
    ble cr1, rupeefinish
    lis r16, _rupeeMultiplier@ha
    lwz r17, _rupeeMultiplier@l(r16)
    cmpwi cr1, r17, 1
    ble cr1, rupeefinish
    mullw r12, r12, r17

rupeefinish:
    add r0, r11, r12
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    addi r1, r1, 0x10
    blr

heartdamagecheck:
    cmpwi cr1, r7, 0
    bge cr1, heartsreturn
    lis r27, _linkDamageMultiplier@ha
    lbz r27, _linkDamageMultiplier@l(r27)
    cmpwi cr1, r27, 0
    beq cr1, heartsreturn
    mullw r27, r7, r27
    add r27, r8, r27
    blr

heartsreturn:
    add r27, r8, r7
    blr

infinitemagiclogic:
    stwu r1, -0x10(r1)
    stw r16, +0x08(r1)

    lis r16, _infiniteMagic@ha
    lbz r16, _infiniteMagic@l(r16)
    cmpwi cr1, r16, 1
    bne cr1, magicreturn
    lbz r0, +0x33(r9)
    lwz r16, +0x08(r1)
    addi r1, r1, 0x10
    blr

magicreturn:
    lwz r16, +0x08(r1)
    addi r1, r1, 0x10
    add r0, r7, r0
    blr

infinitebombslogic:
    lis r31, _infiniteBombs@ha
    lbz r31, _infiniteBombs@l(r31)
    cmpwi cr1, r31, 1
    bne cr1, bombsreturn
    lbz r31, +0x90(r12)
    blr

bombsreturn:
    add r31, r5, r6
    blr

infinitearrowslogic:
    lis r31, _infiniteArrows@ha
    lbz r31, _infiniteArrows@l(r31)
    cmpwi cr1, r31, 1
    bne cr1, arrowsreturn
    lbz r31, +0x8F(r5)
    blr

arrowsreturn:
    add r31, r6, r7
    blr

invincibilitylogic:
    lis r10, _invincibility@ha
    lbz r10, _invincibility@l(r10)
    cmpwi cr1, r10, 1
    bne cr1, invincibilityreturn
    li r10, 2
    sth r10, +0x3B0(r30)

invincibilityreturn:
    lha r10, +0x3B0(r30)
    blr

remotebombslogic:
    stwu r1, -0x20(r1)
    stw r16, +0x08(r1)
    stw r17, +0x0C(r1)
    stw r18, +0x10(r1)
    mflr r18
    stw r18, +0x14(r1)

    lis r16, _remoteBombs@ha
    lbz r17, _remoteBombs@l(r16)
    cmpwi cr1, r17, 1
    bne cr1, remotebombsfinish

    li r16, 0x2000 ;L button
    lis r17, _allowButtonCombos@ha
    lbz r17, _allowButtonCombos@l(r17)
    bl buttonpressedlogic
    cmpwi cr1, r17, 1
    bne cr1, remotebombsreset

    li r10, 1
    sth r10, +0xA7C(r30)
    b remotebombsfinish

remotebombsreset:
    li r10, 0x95
    sth r10, +0xA7C(r30)

remotebombsfinish:
    lwz r18, +0x14(r1)
    mtlr r18
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    lwz r18, +0x10(r1)
    addi r1, r1, 0x20
    lha r10, +0xA7C(r30)
    blr

[MegaCheatsUS]
moduleMatches = 0x475BD29F

.origin = codecave

windfinish:
    addi r9, r9, 0x44f8
    lwz r18, +0x1C(r1)
    mtlr r18
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    lwz r18, +0x10(r1)
    lwz r19, +0x14(r1)
    lwz r20, +0x18(r1)
    addi r1, r1, 0x30
    blr

infiniteheartslogic:
    lis r27, _infiniteHearts@ha
    lbz r27, _infiniteHearts@l(r27)
    cmpwi cr1, r27, 1
    bne cr1, heartdamagecheck
    lhz r27, +0x20(r10)
    rlwinm r27, r27, 0, 0, 29
    blr

0x023FD368 = bla moonjumplogic
0x023FA5A4 = bla invincibilitylogic
0x023DA330 = .int $invincibilityFlash
0x020C6D04 = bla remotebombslogic
0x0240EB44  = bla saveloadcoordslogic
0x0242ED4C = bla linkswimspeedlogic
0x0247E994 = bla sailspeedlogic
0x025193F4 = bla linkdamagegivenlogic
0x0259C4D4 = bla rupeelogic
0x02594584 = bla infiniteheartslogic
0x02599810 = bla infinitearrowslogic
0x025998B8 = bla infinitebombslogic
0x0259B9F0 = bla infinitemagiclogic
0x0257D58C = bla winddirectionlogic
0x026E6C94 = .int $swimStaminaNeverDecrease
0x101f5088 = _controlleroffset:
0x1046438c = _boatXYZ:
0x1046CD12 = _linkFacingAddress:
0x10474342 = _freezeState:
0x104741F0 = _currentRoom:



[MegaCheatsEU]
moduleMatches = 0xb7e748de

.origin = codecave

windfinish:
    addi r9, r9, 0x4510
    lwz r18, +0x1C(r1)
    mtlr r18
    lwz r16, +0x08(r1)
    lwz r17, +0x0C(r1)
    lwz r18, +0x10(r1)
    lwz r19, +0x14(r1)
    lwz r20, +0x18(r1)
    addi r1, r1, 0x30
    blr

infiniteheartslogic:
    lis r31, _infiniteHearts@ha
    lbz r31, _infiniteHearts@l(r31)
    cmpwi cr1, r31, 1
    bne cr1, heartdamagecheck
    lhz r31, +0x20(r10)
    rlwinm r31, r31, 0, 0, 29
    blr



0x023FD36C = bla moonjumplogic
0x023FA5A8 = bla invincibilitylogic
0x023DA334 = .int $invincibilityFlash
0x020C6D04 = bla remotebombslogic
0x0240EB48  = bla saveloadcoordslogic
0x0242ED50 = bla linkswimspeedlogic
0x0247E998 = bla sailspeedlogic
0x025193F8 = bla linkdamagegivenlogic
0x0259C494 = bla rupeelogic
0x02594588 = bla infiniteheartslogic
0x025997E4 = bla infinitearrowslogic
0x0259988C = bla infinitebombslogic
0x0259B9B0 = bla infinitemagiclogic
0x0257d590 = bla winddirectionlogic
0x026E74D8 = .int $swimStaminaNeverDecrease
0x101f50A0 = _controlleroffset:
0x1046438c = _boatXYZ:
0x1046CD12 = _linkFacingAddress:
0x10474342 = _freezeState:
0x104741F0 = _currentRoom:
