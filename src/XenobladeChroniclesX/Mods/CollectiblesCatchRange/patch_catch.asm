[XCX_COLLECTIBLESRANGE]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

; ----------------------------------------------------------------------------
; WHO  : cfs::CfPopManagerItem::updateTouchItem((void))
; WHAT : Initialize collectibles distance
_rangeInnerConst: 
	.float $rangeinner
_heightInnerConst: 
	.float $heightinner
_rangeDollConst: 
	.float $rangedoll
_heightDollConst: 
	.float $heightdoll
_rangeFlightConst: 
	.float $rangeflight
_heightFlightConst: 
	.float $heightflight

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


[XCX_COLLECTIBLESRANGE_V101E_V102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
0x02389B80 = bla _itemRangeInner
0x02389BB8 = bla _itemHeightInner
0x02389C3C = bla _itemRangeDoll
0x02389C74 = bla _itemHeightDoll
0x02389CEC = bla _itemRangeFlight
0x02389D30 = bla _itemHeightFlight

[XCX_COLLECTIBLESRANGE_V102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x023893B4 = bla _itemRangeInner
0x023893EC = bla _itemHeightInner
0x02389470 = bla _itemRangeDoll
0x023894A8 = bla _itemHeightDoll
0x02389520 = bla _itemRangeFlight
0x02389564 = bla _itemHeightFlight

[XCX_COLLECTIBLESRANGE_V100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x02389B10 = bla _itemRangeInner
0x02389B48 = bla _itemHeightInner
0x02389BCC = bla _itemRangeDoll
0x02389C04 = bla _itemHeightDoll
0x02389C7C = bla _itemRangeFlight
0x02389CC0 = bla _itemHeightFlight

[XCX_COLLECTIBLESRANGE_V100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x02389240 = bla _itemRangeInner
0x02389278 = bla _itemHeightInner
0x023892FC = bla _itemRangeDoll
0x02389334 = bla _itemHeightDoll
0x023893AC = bla _itemRangeFlight
0x023893F0 = bla _itemHeightFlight
