[XCX_FPS++_QTE_General] ; ########################################################
moduleMatches = 0x218F6E07, 0xF882D5CF, 0x30B6E091, 0x7672271D ; 1.0.1E, 1.0.2U, 1.0.1U, 1.0.2J

.origin = codecave

_justFrame1:
	lwz r12, 0x47C(r29)
	lis r10, averageFPS1IntInv@ha
	lbz r10, averageFPS1IntInv@l(r10)
	mullw r12, r12, r10
	blr

_justFrame2:
	lwz r0, 0x478(r29)
	lis r8, averageFPS1IntInv@ha
	lbz r8, averageFPS1IntInv@l(r8)
	mullw r0, r0, r8
	blr

[XCX_FPS++_QTE_1E] ; ########################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

; menu::MenuButtonChallenge::setup
0x02ACE40C = lis r7, averageFPS1Inv@ha
0x02ACE414 = lfs f0, averageFPS1Inv@l(r7)

; menu::MenuButtonChallenge::move
0x02ACE6E4 = bla _justFrame1
0x02ACE700 = bla _justFrame2

[XCX_FPS++_QTE_2U] ; ########################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

; menu::MenuButtonChallenge::setup
0x02ACE3FC = lis r7, averageFPS1Inv@ha
0x02ACE404 = lfs f0, averageFPS1Inv@l(r7)

; menu::MenuButtonChallenge::move
0x02ACE6D4 = bla _justFrame1
0x02ACE6F0 = bla _justFrame2

[XCX_FPS++_QTE_2J]
moduleMatches = 0x7672271D ; 1.0.2J

; menu::MenuButtonChallenge::setup
0x02ACAA38 = lis r7, averageFPS1Inv@ha
0x02ACAA40 = lfs f0, averageFPS1Inv@l(r7)

; menu::MenuButtonChallenge::move
0x02ACAD10 = bla _justFrame1
0x02ACAD2C = bla _justFrame2