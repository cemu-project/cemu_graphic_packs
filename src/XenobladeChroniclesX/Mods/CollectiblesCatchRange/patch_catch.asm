[XCX_COLLECTIBLESRANGE_ALL]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0xAB97DE6B ; 1.0.1E, 1.0.2U, 1.0.1U

.origin = codecave

; ----------------------------------------------------------------------------
; WHO  : cfs::CfPopManagerItem::updateTouchItem((void))
; WHAT : Initialize collectibles distance

_rangeInnerConst: 
	.float 40.0
_heightInnerConst: 
	.float 8.0
_rangeDollConst: 
	.float 64.0
_heightDollConst: 
	.float 64.0
_rangeFlightConst: 
	.float 64.0
_heightFlightConst: 
	.float 52.0

_itemRangeInner:
lis r5, _rangeInnerConst@ha
lfs f10, _rangeInnerConst@l(r5)
fadd f10, f9, f10
blr

_itemHeightInner:
lis r5, _heightInnerConst@ha
lfs f12, _heightInnerConst@l(r5)
fadd f12, f10, f12
blr

_itemRangeDoll:
lis r5, _rangeDollConst@ha
lfs f9, _rangeDollConst@l(r5)
fadd f9, f6, f9
blr

_itemHeightDoll:
lis r5, _heightDollConst@ha
lfs f10, _heightDollConst@l(r5)
fadd f10, f7, f10
blr

_itemRangeFlight:
lis r5, _rangeFlightConst@ha
lfs f10, _rangeFlightConst@l(r5)
fadd f10, f12, f10
blr

_itemHeightFlight:
lis r5, _heightFlightConst@ha
lfs f0, _heightFlightConst@l(r5)
fadd f0, f13, f0
blr

[XCX_COLLECTIBLESRANGE] #################################################################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

0x02389B80 = bla _itemRangeInner
0x02389BB8 = bla _itemHeightInner
0x02389C3C = bla _itemRangeDoll
0x02389C74 = bla _itemHeightDoll
0x02389CEC = bla _itemRangeFlight
0x02389D30 = bla _itemHeightFlight

[XCX_COLLECTIBLESRANGE_1U] #################################################################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

0x02389B10 = bla _itemRangeInner
0x02389B48 = bla _itemHeightInner
0x02389BCC = bla _itemRangeDoll
0x02389C04 = bla _itemHeightDoll
0x02389C7C = bla _itemRangeFlight
0x02389CC0 = bla _itemHeightFlight
