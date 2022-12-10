[XCX_BLADE_MORETICKETS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $mult
.int $uncap
; ----------------------------------------------------------------------------
; WHO  : cfs::CfSocialManager::addTradeTicket((int, unsigned int))
; WHAT : Multiply the reward tickets given in many occasions
_moreTickets:
mr r30, r3
cmpwi r4, 0
bltlr
mulli r4, r4, $mult
blr

; ----------------------------------------------------------------------------
; WHO  : cfs::CfSocialManager::addTradeTicket((int, unsigned int))
; WHAT : Ignore the max number of tickets we can get
_uncapTickets:
li r5, $uncap
cmpwi r5, 1
beqlr
mr r3, r25
blr

; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestInfoWindow::displayInfo((menu::MenuObject *,bool))
; WHAT : 
_dispBefore:
lhz       r26, 0x8C(r1)
mulli     r26, r26, $mult
blr

; ----------------------------------------------------------------------------
; WHO  : menu::MenuMultiQuestResult::setup((void))
; WHAT : 
_dispAfter:
lhz       r5, 0x5778(r29)
mulli     r5, r5, $mult
blr

; ----------------------------------------------------------------------------
; WHO  : writeListTicket__Q2_4menu19MenuMultiQuestOrderFPQ2_4menu10MenuObjectiQ3_2fw9CItemType4TypeUsUiT5
; WHAT : multiply tickets from piece exchange
_pieceExchange:
mr 	   r5, r29
cmpwi r26, 0x1E
bnelr
mulli     r5, r5, $mult
blr

; menu::MenuMultiQuestOrder::move((void))
_dispExchangeInit:
lhz r6, 0xC(r26)
lwz r3, 0x4840(r31)
cmpwi r3, 7
bne _exitExchangeInit
mulli r6, r6, $mult
_exitExchangeInit:
cmpwi r11, 0
blr

; menu::MenuMultiQuestOrder::onCursorMove((int))
_dispExchangeUpdate:
mr r29, r4
cmpwi r9, 7
bnelr
mulli r29, r29, $mult
blr


;#####################################################################################################
[XCX_BLADE_MORETICKETS_V101E]
moduleMatches = 0xF882D5CF, 0x218F6E07 ; 1.0.1E, 1.0.0E
0x022CA86C = bla _moreTickets
0x022CAC5C = bla _uncapTickets
0x02B94718 = bla _dispBefore
0x02B9FE2C = bla _dispAfter
0x02B9796C = bla _pieceExchange
0x02B9C1EC = bla _dispExchangeInit
0x02C7C07C = bla _dispExchangeUpdate

;#####################################################################################################
[XCX_BLADE_MORETICKETS_V102U]
moduleMatches = 0x30B6E091 ; 1.0.2U
0x022CA86C = bla _moreTickets
0x022CAC5C = bla _uncapTickets
0x02B94708 = bla _dispBefore
0x02B9FE1C = bla _dispAfter
0x02B9795C = bla _pieceExchange
0x02B9C1DC = bla _dispExchangeInit
0x02C7C01C = bla _dispExchangeUpdate

;#####################################################################################################
[XCX_BLADE_MORETICKETS_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x022CA09C = bla _moreTickets
0x022CA48C = bla _uncapTickets
0x02B90654 = bla _dispBefore
;0x02B9B938 = bla _dispAfter ;not working
0x02B938A8 = bla _pieceExchange
0x02B97D08 = bla _dispExchangeInit
0x02C77570 = bla _dispExchangeUpdate

;#####################################################################################################
[XCX_BLADE_MORETICKETS_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x022CA7FC = bla _moreTickets
0x022CABEC = bla _uncapTickets
0x02B9468C = bla _dispBefore
0x02B9FD2C = bla _dispAfter
0x02B978E0 = bla _pieceExchange
0x02B9C0EC = bla _dispExchangeInit
0x02C7BEA4 = bla _dispExchangeUpdate

;#####################################################################################################
[XCX_BLADE_MORETICKETS_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x022C9F28 = bla _moreTickets
0x022CA318 = bla _uncapTickets
0x02B8DDA8 = bla _dispBefore
;0x02B98F68 = bla _dispAfter ;not working
0x02B90F84 = bla _pieceExchange
0x02B953A4 = bla _dispExchangeInit
0x02C73A5C = bla _dispExchangeUpdate
