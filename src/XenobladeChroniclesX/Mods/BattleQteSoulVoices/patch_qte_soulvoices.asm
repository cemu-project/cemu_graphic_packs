[XCX_QTE_AUTO_V101E_V102U_V100U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07, 0xAB97DE6B, 0x676EB33E ; 1.0.1E, 1.0.2U, 1.0.0E, 1.0.1U, 1.0.0U
; ----------------------------------------------------------------------------
; WHO  : Battle::CSoulVoiceButtonChallenge::applyResult((void))
; WHAT : Force QTE result on Soul Voices (0 = fail 1 = good, 2 = excellent)
0x0209BA38 = li r9, $mod
; ----------------------------------------------------------------------------
; WHO  : Battle::CSoulVoiceButtonChallenge::updateInternal((float))
; WHAT : Auto Apply QTE (dot not call Battle::CButtonChallengeManager::CallUI)
0x0209D764 = _applyResult:
0x0209D6F0 = b _applyResult
0x0209D720 = b _applyResult

[XCX_QTE_AUTO_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x0209B504 = li r9, $mod
0x0209D230 = _applyResult:
0x0209D1BC = b _applyResult
0x0209D1EC = b _applyResult

[XCX_QTE_AUTO_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x0209B290 = li r9, $mod
0x0209CFBC = _applyResult:
0x0209CF48 = b _applyResult
0x0209CF78 = b _applyResult
