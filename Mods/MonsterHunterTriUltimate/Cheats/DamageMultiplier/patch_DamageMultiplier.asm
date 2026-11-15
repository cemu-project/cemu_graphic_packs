[MH3U_DamageMultiplier_US_v32]
moduleMatches = 0x9d2f15e5

; Each frame the monster update loop (0x025cb540) reads every part's pending damage
; from stats+0x8ec+2*i. That one value feeds the HP loss, the flinch counter (stats+0x9dc)
; and the part damage, so scaling it at the load scales all three.
; r0 is free here: the loop overwrites it before reading it again.

.origin = codecave
_scalePendingDamage:
lha r19, 0x8ec(r12)       ; original instruction
mulli r19, r19, $mult     ; damage * mult / 10, rounded
addi r19, r19, 5
li r0, 10
divw r19, r19, r0
cmpwi r19, 0x7FFF         ; the table is 16-bit
ble _scaleDone
li r19, 0x7FFF
_scaleDone:
b 0x025cb55c

0x025cb558 = b _scalePendingDamage
