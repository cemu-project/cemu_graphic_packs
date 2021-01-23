[XCX_60FPS_QTE] ; ########################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

_setup:
	.float 15.0 ; reduces speed of animation

_justFrame1:
	lwz r12, 0x47C(r29)
	mulli r12, r12, 2
	blr

_justFrame2:
	lwz r0, 0x478(r29)
	mulli r0, r0, 2
	blr

[XCX_60FPS_QTE_1E] ; ########################################################
moduleMatches = 0xF882D5CF ; 1.0.1E

; menu::MenuButtonChallenge::setup
0x02ACE40C = lis r7, _setup@ha
0x02ACE414 = lfs f0, _setup@l(r7)

; menu::MenuButtonChallenge::move
0x02ACE6E4 = bla _justFrame1
0x02ACE700 = bla _justFrame2

[XCX_60FPS_QTE_2U] ; ########################################################
moduleMatches = 0x30B6E091 ; 1.0.2U

; menu::MenuButtonChallenge::setup
0x02ACE3FC = lis r7, _setup@ha
0x02ACE404 = lfs f0, _setup@l(r7)

; menu::MenuButtonChallenge::move
0x02ACE6D4 = bla _justFrame1
0x02ACE6F0 = bla _justFrame2

