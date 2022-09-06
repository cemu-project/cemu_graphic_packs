[XCX_DISTMOBINFO]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

; ----------------------------------------------------------------------------
; WHAT : cfs::CfPopManagerMobInfo::setupZone((cfs::ZoneTypes))
; WHY  : Initialize view distance for ALL the Mob information to a very high value (filter will be done in setup function)
_init_react:
lis       r3, 0x4300
addi      r3, r3, 0x0000
mr        r5, r27
blr

; ----------------------------------------------------------------------------
; WHAT : cfs::CfMobInfo::setup((void))
; WHY  : Adjust the view distance based on the information type
_info_default:
cmpwi     r6, 2
beq       tes
lhz       r8, 0x20(r29)
cmpwi     r8, 0x4300
blt       exit_info_default
lis       r8, 0x4120
addi      r8, r8, 0x0000
stw       r8, 0x20(r29)
li        r6, 0
tes:
stw       r6, 0x40(r29)
exit_info_default:
blr

_info_obtained:
lhz       r8, 0x20(r29)
cmpwi     r8, 0x4300
blt       exit_info_obtained
lis       r8, 0x4120
addi      r8, r8, 0x0000
stw       r8, 0x20(r29)
li        r10, 0
stw       r10, 0x40(r29)
exit_info_obtained:
blr

[XCX_DISTMOBINFO_V101E_V102U] ; ###########################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x02387260 = bla _init_react
0x02386F04 = bla _info_obtained
0x02386F34 = bla _info_default

; ----------------------------------------------------------------------------
; WHAT : cfs::CfPopManagerMobInfo::updatePop((ml::CVec3 const &, bool))
0x0238EEC0 = nop ; Disable the call of cfs::CfMobInfo::update function (may have side effects)
0x0238EF30 = nop ; Disable altitude check

; ----------------------------------------------------------------------------
; WHAT : cfs::CfPopManager::isCheckDoll(const(void))
; WHY  : display bubbles even in skell
0x0238745C = li r3, 0

[XCX_DISTMOBINFO_V102J] ; ###########################################################
moduleMatches = 0x7672271D ; 1.0.2J
0x02386A94 = bla _init_react
0x02386738 = bla _info_obtained
0x02386768 = bla _info_default

0x0238E6F4 = nop ; Disable the call of cfs::CfMobInfo::update function (may have side effects)
0x0238E764 = nop ; Disable altitude check

0x02386C90 = li r3, 0

[XCX_DISTMOBINFO_V100U] ; ###########################################################
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x023871F0 = bla _init_react
0x02386E94 = bla _info_obtained
0x02386EC4 = bla _info_default

0x0238EE50 = nop ; Disable the call of cfs::CfMobInfo::update function (may have side effects)
0x0238EEC0 = nop ; Disable altitude check

0x023873EC = li r3, 0

[XCX_DISTMOBINFO_V100J] ; ###########################################################
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02386920 = bla _init_react
0x023865C4 = bla _info_obtained
0x023865F4 = bla _info_default

0x0238E580 = nop ; Disable the call of cfs::CfMobInfo::update function (may have side effects)
0x0238E5F0 = nop ; Disable altitude check

0x02386B1C = li r3, 0
