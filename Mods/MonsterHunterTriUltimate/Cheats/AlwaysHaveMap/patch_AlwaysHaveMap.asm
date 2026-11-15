[MH3U_AlwaysHaveMap_US_v32]
moduleMatches = 0x9d2f15e5

; canSeeMap(?, player) at 0x0260eea8 decides whether the map UI gets filled in.
; It returns 1 early for a global flag (+0x1b9) and conditions 0xdb/0x87, 0 for
; location type 6 or condition 0x88, and otherwise returns
; getItemCount(player, 1010 = Map) != 0 (0x0285e7c8).
; Dropping the branch on that count makes the last case always return 1;
; the other rules are unchanged.

0x0260ef34 = nop
