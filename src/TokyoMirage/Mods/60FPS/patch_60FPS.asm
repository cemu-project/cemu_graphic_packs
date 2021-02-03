[TMS_60FPS]
moduleMatches = 0x2249A57A

0x1002A6E4 = .float 0.016666667
0x0202034C = _frameTime:

0x021A7654 = lis r10, _frameTime@ha		; Cutscene Speed
0x021A765C = lfs f1, _frameTime@l(r10)	; Gameplay Speed

0x0244D434 = li r4, 1					; Change vsync mode
0x0248BF04 = nop						; Disable vsync
0x0248B11C = nop						; Disable vsync

; 0x10065E50 = .float 0.033333335 ; cinematic animation speed, for future reference
