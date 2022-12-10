[XCX_MAXITEMS]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave
.int $max

_testsub:
lwz	r29, 0xC(r1)
cmpwi r3, 255
ble exit_testsub
li r3, 255
exit_testsub:
blr


[XCX_MAXITEMS_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
; cfs::CfItemBoxBase::addItem((fw::CItemType::Type, unsigned int, cfs::CfItemHandle &)) --> used to allow more than 99 (if not, auto sell)
0x02362C8C = cmplwi r12, $max

; cfs::CfItemBoxBase::canAddItem((fw::CItemType::Type,uint)) --> used in ticket trading window
0x02363108 = cmplwi r12, $max

; cfs::CfItemBoxBase::getFreeStackCount((fw::CItemType::Type,uint)) --> returns max quantity allowed to buy
0x023639DC = li r0, $max ; when some items in stock
0x023639FC = li r0, $max ; when no item in stock

0x02363A28 = bla _testsub

[XCX_MAXITEMS_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x023624C0 = cmplwi r12, $max
0x0236293C = cmplwi r12, $max

0x02363210 = li r0, $max ; when some items in stock
0x02363230 = li r0, $max ; when no item in stock

0x0236325C = bla _testsub

[XCX_MAXITEMS_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02362C1C = cmplwi r12, $max
0x02363098 = cmplwi r12, $max

0x0236396C = li r0, $max ; when some items in stock
0x0236398C = li r0, $max ; when no item in stock

0x023639B8 = bla _testsub

[XCX_MAXITEMS_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x0236234C = cmplwi r12, $max
0x023627C8 = cmplwi r12, $max

0x0236309C = li r0, $max ; when some items in stock
0x023630BC = li r0, $max ; when no item in stock

0x023630E8 = bla _testsub
