
[TransformersPrime_UpgradeTimer_Test]
moduleMatches = 0x926B35F7

# Human Scope:
# 0 = Off
# 1 = Story only
# 2 = Multiplayer only
# 3 = Both
#
# CPU Mayhem:
# 0 = Original CPU rules
# 1 = Unlimited CPU upgrade in multiplayer
#
# Game mode byte:
# 1 = Story
# 0 = Multiplayer
#
# CPU flag:
# 0x14(fighter)
# 0 = Human
# 1 = CPU

0x0201F988 = bla InitializeUpgradeEnergy

.origin = codecave

# -----------------------------------------
# Starting Upgrade Energy
# -----------------------------------------

InitializeUpgradeEnergy:
stwu r1, -0x10(r1)
stw r0, 0xC(r1)
stw r12, 0x8(r1)

# Determine human or CPU
lbz r0, 0x14(r30)
cmpwi r0, 0
bne InitCPU

# Human: read current game mode
lis r12, 0x1011
lwz r12, 0x5EE8(r12)
lbz r0, 0x20(r12)

cmpwi r0, 1
beq InitHumanStory

# Human in Multiplayer
li r0, $humanScope
cmpwi r0, 2
beq InitFull
cmpwi r0, 3
beq InitFull
b InitOriginal

InitHumanStory:
li r0, $humanScope
cmpwi r0, 1
beq InitFull
cmpwi r0, 3
beq InitFull
b InitOriginal

InitCPU:
# CPU Mayhem applies only to Multiplayer
lis r12, 0x1011
lwz r12, 0x5EE8(r12)
lbz r0, 0x20(r12)
cmpwi r0, 0
bne InitOriginal

li r0, $cpuMayhem
cmpwi r0, 0
bne InitFull

InitOriginal:
# Original game initialization
stfs f30, 0x270(r30)
b InitDone

InitFull:
# Full Upgrade Energy
stfs f11, 0x270(r30)

InitDone:
lwz r12, 0x8(r1)
lwz r0, 0xC(r1)
addi r1, r1, 0x10
blr

# -----------------------------------------
# Upgrade Energy Consumption
# -----------------------------------------

SkipEnergyConsumption:
stwu r1, -0x10(r1)
stw r0, 0xC(r1)
stw r12, 0x8(r1)

# CPU always uses normal energy consumption
lbz r0, 0x14(r19)
cmpwi r0, 0
bne EnergyOriginal

# Human: read game mode
lis r12, 0x1011
lwz r12, 0x5EE8(r12)
lbz r0, 0x20(r12)

cmpwi r0, 1
beq EnergyHumanStory

# Human in Multiplayer
li r0, $humanScope
cmpwi r0, 2
beq EnergyDone
cmpwi r0, 3
beq EnergyDone
b EnergyOriginal

EnergyHumanStory:
li r0, $humanScope
cmpwi r0, 1
beq EnergyDone
cmpwi r0, 3
beq EnergyDone

EnergyOriginal:
# Original energy consumption
stfs f13, 0x270(r19)

EnergyDone:
lwz r12, 0x8(r1)
lwz r0, 0xC(r1)
addi r1, r1, 0x10
blr

# -----------------------------------------
# Upgrade Timer
# -----------------------------------------

ConditionalUpgradeTimer:
stwu r1, -0x10(r1)
stw r0, 0xC(r1)
stw r12, 0x8(r1)

lbz r0, 0x14(r19)
cmpwi r0, 0
bne TimerCPU

# Human: read game mode
lis r12, 0x1011
lwz r12, 0x5EE8(r12)
lbz r0, 0x20(r12)

cmpwi r0, 1
beq TimerHumanStory

# Human in Multiplayer
li r0, $humanScope
cmpwi r0, 2
beq CheckInfiniteTimer
cmpwi r0, 3
beq CheckInfiniteTimer
b RunOriginalCountdown

TimerHumanStory:
li r0, $humanScope
cmpwi r0, 1
beq CheckInfiniteTimer
cmpwi r0, 3
beq CheckInfiniteTimer
b RunOriginalCountdown

TimerCPU:
# CPU Mayhem: Multiplayer only
lis r12, 0x1011
lwz r12, 0x5EE8(r12)
lbz r0, 0x20(r12)

cmpwi r0, 0
bne RunOriginalCountdown

li r0, $cpuMayhem
cmpwi r0, 0
beq RunOriginalCountdown

CheckInfiniteTimer:
lhz r0, 0x278(r19)
cmplwi r0, 0x40A0
bgt KeepTimerFrozen

RunOriginalCountdown:
# Original timer calculation
fnmsubs f13, f9, f11, f13

KeepTimerFrozen:
lwz r12, 0x8(r1)
lwz r0, 0xC(r1)
addi r1, r1, 0x10
blr

# -----------------------------------------
# Human L-button Toggle
# -----------------------------------------

ToggleOnLPress:
stwu r1, -0x10(r1)
stw r0, 0xC(r1)
stw r12, 0x8(r1)

# Never allow CPU to use our manual toggle
lbz r0, 0x14(r19)
cmpwi r0, 0
bne ToggleDone

# Human: read game mode
lis r12, 0x1011
lwz r12, 0x5EE8(r12)
lbz r0, 0x20(r12)

cmpwi r0, 1
beq ToggleHumanStory

# Human in Multiplayer
li r0, $humanScope
cmpwi r0, 2
beq ToggleHumanEnabled
cmpwi r0, 3
beq ToggleHumanEnabled
b ToggleDone

ToggleHumanStory:
li r0, $humanScope
cmpwi r0, 1
beq ToggleHumanEnabled
cmpwi r0, 3
beq ToggleHumanEnabled
b ToggleDone

ToggleHumanEnabled:
# Activation allowed: do nothing special
cmpwi r3, 0
bne ToggleDone

# Request deactivation if timer is above 5
lhz r0, 0x278(r19)
cmplwi r0, 0x40A0
ble ToggleDone

# Set countdown to float 5.0
lis r0, 0x40A0
stw r0, 0x278(r19)

ToggleDone:
lwz r12, 0x8(r1)
lwz r0, 0xC(r1)
addi r1, r1, 0x10

# Restore original activation comparison
cmpwi r3, 0
blr

# -----------------------------------------
# Apply patches
# -----------------------------------------

0x02026070 = bla SkipEnergyConsumption
0x02025CD4 = bla ConditionalUpgradeTimer
0x02025F30 = bla ToggleOnLPress