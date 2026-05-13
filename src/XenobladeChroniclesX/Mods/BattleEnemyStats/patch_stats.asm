[XCX_EnemyStats]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x7672271D, 0x218F6E07, 0xAB97DE6B, 0x676EB33E, 0x785CA8A9 ; 1.0.1E, 1.0.2U, 1.0.2J, 1.0.0E, 1.0.1U, 1.0.0U, 1.0.0J
.origin = codecave

float_EnemyMeleeAttackMult:
.float $meleeatk
float_EnemyRangedAttackMult:
.float $rangedatk
float_EnemyPotentialMult:
.float $potential
float_EnemyEvasionMult:
.float $evasion
float_EnemyMeleeAccuracyMult:
.float $meleeacc
float_EnemyRangedAccuracyMult:
.float $rangedacc
float_EnemyHPMult:
.float $hp
float_EnemyOtherMult:
.float $other

EnemyStatsMultMeleeAttack:
lis r3, float_EnemyMeleeAttackMult@ha
lfs f31, float_EnemyMeleeAttackMult@l(r3)
or r3, r24, r24
blr

EnemyStatsMultRangedAttack:
lis r3, float_EnemyRangedAttackMult@ha
lfs f31, float_EnemyRangedAttackMult@l(r3)
or r3, r24, r24
blr

EnemyStatsMultPotential:
lis r3, float_EnemyPotentialMult@ha
lfs f31, float_EnemyPotentialMult@l(r3)
or r3, r24, r24
blr

EnemyStatsMultEvasion:
lis r3, float_EnemyEvasionMult@ha
lfs f31, float_EnemyEvasionMult@l(r3)
or r3, r24, r24
blr

EnemyStatsMultMeleeAccuracy:
lis r3, float_EnemyMeleeAccuracyMult@ha
lfs f31, float_EnemyMeleeAccuracyMult@l(r3)
or r3, r24, r24
blr

EnemyStatsMultRangedAccuracy:
lis r3, float_EnemyRangedAccuracyMult@ha
lfs f31, float_EnemyRangedAccuracyMult@l(r3)
or r3, r23, r23
blr

EnemyStatsMultHP:
lis r3, float_EnemyHPMult@ha
lfs f31, float_EnemyHPMult@l(r3)
or r3, r24, r24
blr

EnemyStatsMultOther:
lis r9, float_EnemyOtherMult@ha
lfs f31, float_EnemyOtherMult@l(r9)
lis r9, 0x1003
blr

[XCX_EnemyStats_v101E_v102U]
moduleMatches = 0xF882D5CF, 0x30B6E091, 0x218F6E07 ; 1.0.1E, 1.0.2U, 1.0.0E
;calcEnParam__3cfsFPQ2_3cfs7SChrPrmUiT2
0x1003206C = .float $other
0x025D7280 = bla EnemyStatsMultHP
0x025D72C4 = bla EnemyStatsMultMeleeAttack
0x025D7300 = bla EnemyStatsMultRangedAttack
0x025D7344 = bla EnemyStatsMultPotential
0x025D7384 = bla EnemyStatsMultEvasion
0x025D73C0 = bla EnemyStatsMultMeleeAccuracy
0x025D73FC = bla EnemyStatsMultRangedAccuracy
0x025D7414 = bla EnemyStatsMultOther

[XCX_EnemyStats_v102J]
moduleMatches = 0x7672271D ; 1.0.2J
0x1003202C = .float $other
0x025D685C = bla EnemyStatsMultHP
0x025D68A0 = bla EnemyStatsMultMeleeAttack
0x025D68DC = bla EnemyStatsMultRangedAttack
0x025D6920 = bla EnemyStatsMultPotential
0x025D6960 = bla EnemyStatsMultEvasion
0x025D699C = bla EnemyStatsMultMeleeAccuracy
0x025D69D8 = bla EnemyStatsMultRangedAccuracy
0x025D69F0 = bla EnemyStatsMultOther

[XCX_EnemyStats_v100U]
moduleMatches = 0xAB97DE6B, 0x676EB33E ; 1.0.1U, 1.0.0U
0x1003206C = .float $other
0x025D7210 = bla EnemyStatsMultHP
0x025D7254 = bla EnemyStatsMultMeleeAttack
0x025D7290 = bla EnemyStatsMultRangedAttack
0x025D72D4 = bla EnemyStatsMultPotential
0x025D7314 = bla EnemyStatsMultEvasion
0x025D7350 = bla EnemyStatsMultMeleeAccuracy
0x025D738C = bla EnemyStatsMultRangedAccuracy
0x025D73A4 = bla EnemyStatsMultOther

[XCX_EnemyStats_v100J]
moduleMatches = 0x785CA8A9 ; 1.0.0J
0x10031FDC = .float $other
0x025D5D80 = bla EnemyStatsMultHP
0x025D5DC4 = bla EnemyStatsMultMeleeAttack
0x025D5E00 = bla EnemyStatsMultRangedAttack
0x025D5E44 = bla EnemyStatsMultPotential
0x025D5E84 = bla EnemyStatsMultEvasion
0x025D5EC0 = bla EnemyStatsMultMeleeAccuracy
0x025D5EFC = bla EnemyStatsMultRangedAccuracy
0x025D5F14 = bla EnemyStatsMultOther
