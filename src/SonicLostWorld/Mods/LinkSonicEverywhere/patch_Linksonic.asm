[sonic2013_v48]
moduleMatches = 0xC5691A40

; load Linksonic in Stage

; load Linksonic on top of Sonic
0x02A60414 = nop
0x02A53680 = nop

; load ef_dl3_linksonic_speedrun instead of ef_ch_son_yh1_speedrun_loop
0x02A43FE0 = nop
0x02A44058 = nop

; load chr_Linksonic shadow model instead of chr_Sonic shadow model
0x02A607F8 = nop


; load Linksonic in WorldAreaMap

0x026D285C = GetPackFile:
0x026D28E4 = GetModelResource:
0x026D2C40 = GetSkeletonResource:

0x101AC668 = LinksonicPacLoad:
0x101AC678 = LinksonicPacInit:
0x101AC688 = chrLinkSonic:

.origin = codecave


; app::WorldAreaMapInfo::Initialize - 0x02B10664
_linkSonicInit:

; app::ObjUtil::GetPackFile
lis r4, LinksonicPacInit@ha
addi r3, r1, 0x14
addi r4, r4, LinksonicPacInit@l
bl GetPackFile

; app::ObjUtil::GetModelResource
lis r31, chrLinkSonic@ha
addi r3, r1, 0x40
addi r5, r1, 0x14
addi r4, r31, chrLinkSonic@l
bl GetModelResource

; hh::ut::Packfile::Packfile
lwz r0, 0x40(r1)
addi r4, r1, 0x14
addi r3, r1, 0x20
stw r0, 0x10(r30)
bl 0x036924C8

; app::ObjUtil::GetSkeletonResource
mr r5, r3
addi r3, r1, 0x44
addi r4, r31, chrLinkSonic@l
bl GetSkeletonResource

; return to original code
lmw r23, 0x134(r1)
b 0x02B10D74

; app::WorldAreaMapInfo::Load - 0x02B0FCE4
_linkSonicLoad:
lwz r12, 0(r31)
lwz r0, 0xC(r12)
lis r4, LinksonicPacLoad@ha
mtctr r0
addi r4, r4, LinksonicPacLoad@l
li r5, 0x4001
mr r3, r31
bctrl

; return to original code
lwz r12, 0(r31)
b 0x02B0FD04

0x02B0FD00 = b _linkSonicLoad
0x02B10D70 = b _linkSonicInit
