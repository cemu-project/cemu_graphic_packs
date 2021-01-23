[XCX_MAXITEMS] ##########################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

.origin = codecave

; cfs::CfItemBoxBase::addItem((fw::CItemType::Type, unsigned int, cfs::CfItemHandle &)) --> used to allow more than 99 (if not, auto sell)
0x02362C8C = cmplwi r12, 999

; cfs::CfItemBoxBase::canAddItem((fw::CItemType::Type,uint)) --> used in ticket trading window
0x02363108 = cmplwi r12, 999

; cfs::CfItemBoxBase::getFreeStackCount((fw::CItemType::Type,uint)) --> returns max quantity allowed to buy
0x023639DC = li r0, 999 ; when some items in stock
0x023639FC = li r0, 999 ; when no item in stock

_testsub:
lwz	r29, 0xC(r1)
cmpwi r3, 255
ble exit_testsub
li r3, 255
exit_testsub:
blr

0x02363A28 = bla _testsub

[XCX_MAXITEMS_1U] ##########################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

.origin = codecave

0x02362C1C = cmplwi r12, 999
0x02363098 = cmplwi r12, 999

0x0236396C = li r0, 999 ; when some items in stock
0x0236398C = li r0, 999 ; when no item in stock

_testsub:
lwz	r29, 0xC(r1)
cmpwi r3, 255
ble exit_testsub
li r3, 255
exit_testsub:
blr

0x023639B8 = bla _testsub
