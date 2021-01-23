[XCX_QTE_AUTO_ALL] #################################################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

; ----------------------------------------------------------------------------
; WHO  : Battle::CSoulVoiceButtonChallenge::applyResult((void))
; WHAT : Force QTE result on Soul Voices (0 = fail 1 = good, 2 = excellent)

0x0209BA38 = li r9, 2

; ----------------------------------------------------------------------------
; WHO  : Battle::CSoulVoiceButtonChallenge::updateInternal((float))
; WHAT : Auto Apply QTE (dot not call Battle::CButtonChallengeManager::CallUI)

0x0209D764 = _applyResult:
0x0209D6F0 = b _applyResult
0x0209D720 = b _applyResult
