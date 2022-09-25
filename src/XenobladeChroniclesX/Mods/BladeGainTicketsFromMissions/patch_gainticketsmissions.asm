[XCX_TICKETS_DLC]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mission

VarTicketsAmount:
.int 0
; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestInfoWindow::displayInfo((menu::MenuObject *,bool))
;        menu::MenuMultiQuestResult::setup((void))
;        addReward__Q2_3cfs11CfSquadUtilSFUiT1
; WHAT : Override the Tickets rewarded for a DLC mission.
;        By default, the number of tickets is the money divided by 100.

_ticketsDispBefore:
lwz       r24, 0x47C(r30)
lwz       r24, 8(r24) ; mission type
li        r26, $mission
cmplw     r24, r26
li        r26, 0
lis       r21, VarTicketsAmount@ha
stw       r26, VarTicketsAmount@l(r21)
bnelr
mr        r26, r23 ; r23 = exp
cmpwi     r24, 5
bne       saveAmount
li        r24, 100
divw      r26, r22, r24 ; r22 = money
saveAmount:
lis       r21, VarTicketsAmount@ha
stw       r26, VarTicketsAmount@l(r21)
blr

_ticketsDispAfter:
lis       r5, VarTicketsAmount@ha
lwz       r5, VarTicketsAmount@l(r5)
blr

_ticketsValue:
lis       r27, VarTicketsAmount@ha
lwz       r27, VarTicketsAmount@l(r27)
blr

_ticketsValueJP:
lis       r4, VarTicketsAmount@ha
lwz       r4, VarTicketsAmount@l(r4)
blr


[XCX_TICKETS_DLC_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x02B94718 = bla _ticketsDispBefore
0x02B9FE2C = bla _ticketsDispAfter
0x023CC654 = bla _ticketsValue

[XCX_TICKETS_DLC_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x02B94708 = bla _ticketsDispBefore
0x02B9FE1C = bla _ticketsDispAfter
0x023CC654 = bla _ticketsValue

[XCX_TICKETS_DLC_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x02B90654 = bla _ticketsDispBefore
0x02B9B938 = bla _ticketsDispAfter ;
0x023CBE48 = bla _ticketsValueJP
0x023CBF2C = bla _ticketsValueJP

[XCX_TICKETS_DLC_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02B9468C = bla _ticketsDispBefore
0x02B9FD2C = bla _ticketsDispAfter
0x023CC5E4 = bla _ticketsValue

[XCX_TICKETS_DLC_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02B8DDA8 = bla _ticketsDispBefore
0x02B98F68 = bla _ticketsDispAfter ;
0x023CB978 = bla _ticketsValueJP
0x023CBA5C = bla _ticketsValueJP
