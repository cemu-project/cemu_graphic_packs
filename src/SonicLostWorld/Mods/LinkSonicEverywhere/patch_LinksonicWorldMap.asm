[sonic2013_v48]
moduleMatches = 0xC5691A40

.origin = codecave

; app::WorldAreaMapInfo::Load
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


; app::WorldAreaMapInfo::Initialize
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

lwz r0, 0x40(r1)
addi r4, r1, 0x14
addi r3, r1, 0x20
stw r0, 0x10(r30)
bl 0x036924C8 ; hh::ut::Packfile::Packfile

; app::ObjUtil::GetSkeletonResource
mr r5, r3
addi r3, r1, 0x44
addi r4, r31, chrLinkSonic@l
bl GetSkeletonResource

; return to original code
lmw r23, 0x134(r1)
b 0x02B10D74


0x02B0FD00 = b _linkSonicLoad
0x02B10D70 = b _linkSonicInit
