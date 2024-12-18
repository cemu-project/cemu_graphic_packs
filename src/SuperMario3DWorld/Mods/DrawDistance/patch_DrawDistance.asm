[SuperMario3DWorld_DrawDistance]
moduleMatches = 0xD2308838, 0xBBAF1908, 0xEB70C731 ; (EU), (NA), (JP)
; patch object clip
0x103693D8 = .float 700000.0  ; Distant clip (coins, boxes, enemies)
0x103693DC = .float 4000.0    ; Lev obj draw
0x10290DA4 = .float 200000.0  ; Passive movement patterns
;0x103852B8 = .float 10000.0  ; map dist mtx??  ;trace
;0x10368418 = .float 1500.0   ; plussy levels, glitches camera, glitches overworld  ;trace
0x1036886C =  .float 1000000.0 ; World draw, check reasonable includes unintended areas.
