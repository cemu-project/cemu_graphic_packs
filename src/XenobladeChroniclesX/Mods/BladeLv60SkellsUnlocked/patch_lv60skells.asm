[XCX_UNLOCKPOSTSKELLS_ALL] ################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

.int $miranium
.int $resource
.int $ignoreLevel

LbIgnoreLevel:
	cmpwi r3, $ignoreLevel
	bnelr
	li r3, 1
	blr

[XCX_UNLOCKPOSTSKELLS_1E] ################################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

; menu::MenuArmsCompanyDevelopSelectBlueprint::CheckEnableDevelop(const(int, bool))
0x02A7A784 = li r3, $miranium
0x02A7A954 = li r3, $resource

; menu::MenuArmsCompany::IsDollLicense(const(void))
0x02A6B838 = li r3, 1 ; always returns true

; menu::MenuArmsCompanyDevelopSelectBlueprint::InitializeItemData((void))
0x02A7B220 = li r30, 0 ; unlock everything

0x02AF8EA8 = b LbIgnoreLevel

[XCX_UNLOCKPOSTSKELLS_2U] ################################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

0x02A6B828 = li r3, 1
0x02A7B210 = li r30, 0
0x02A7A774 = li r3, $miranium
0x02A7A944 = li r3, $resource
0x02AF8E98 = b LbIgnoreLevel

[XCX_UNLOCKPOSTSKELLS_1U] ################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x02A6B7AC = li r3, 1 ; always returns true
0x02A7B194 = li r30, 0 ; unlock everything
0x02A7A6F8 = li r3, $miranium
0x02A7A8C8 = li r3, $resource
0x02AF8E1C = b LbIgnoreLevel