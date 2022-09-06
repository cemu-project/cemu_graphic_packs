[XCX_UNLOCKPOSTSKELLS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $miranium
.int $resource
.int $ignoreLevel

LbIgnoreLevel:
	cmpwi r3, $ignoreLevel
	bnelr
	li r3, 1
	blr


[XCX_UNLOCKPOSTSKELLS_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
; menu::MenuArmsCompanyDevelopSelectBlueprint::CheckEnableDevelop(const(int, bool))
0x02A7A784 = li r3, $miranium
0x02A7A954 = li r3, $resource
; menu::MenuArmsCompany::IsDollLicense(const(void))
0x02A6B838 = li r3, 1 ; always returns true
; menu::MenuArmsCompanyDevelopSelectBlueprint::InitializeItemData((void))
0x02A7B220 = li r30, 0 ; unlock everything

0x02AF8EA8 = b LbIgnoreLevel

[XCX_UNLOCKPOSTSKELLS_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02A7A774 = li r3, $miranium
0x02A7A944 = li r3, $resource
0x02A6B828 = li r3, 1 ; always returns true
0x02A7B210 = li r30, 0 ; unlock everything
0x02AF8E98 = b LbIgnoreLevel

[XCX_UNLOCKPOSTSKELLS_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02A76CEC = li r3, $miranium
0x02A76EBC = li r3, $resource
0x02A67DA0 = li r3, 1 ; always returns true
0x02A77788 = li r30, 0 ; unlock everything
0x02AF54B8 = b LbIgnoreLevel

[XCX_UNLOCKPOSTSKELLS_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02A7A6F8 = li r3, $miranium
0x02A7A8C8 = li r3, $resource
0x02A6B7AC = li r3, 1 ; always returns true
0x02A7B194 = li r30, 0 ; unlock everything
0x02AF8E1C = b LbIgnoreLevel

[XCX_UNLOCKPOSTSKELLS_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02A75124 = li r3, $miranium
0x02A752F4 = li r3, $resource
0x02A6626C = li r3, 1 ; always returns true
0x02A75BC0 = li r30, 0 ; unlock everything
0x02AF3444 = b LbIgnoreLevel
