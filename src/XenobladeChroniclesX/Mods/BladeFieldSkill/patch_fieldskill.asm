[XCX_FieldSkill]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

_FieldSkillLevelMod:
;applies our cheat ;~1B7C4038
li r0, $meclevel
stb r0,-0x7548(r30)
li r0, $biolevel
stb r0,-0x7547(r30)
li r0, $arclevel
stb r0,-0x7546(r30)

;fixes line we overwrote
lbzu r0,-0x7548(r30)
blr

[XCX_FeildSkill_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x02C1AA2C = bla _FieldSkillLevelMod

[XCX_FeildSkill_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02C1AA38 = bla _FieldSkillLevelMod

[XCX_FeildSkill_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02C163D0 = bla _FieldSkillLevelMod

[XCX_FeildSkill_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02C1A8C0 = bla _FieldSkillLevelMod

[XCX_FeildSkill_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02C1344C = bla _FieldSkillLevelMod
