[XCX_MAXMONEY] ##############################################################
moduleMatches = 0xF882D5CF, 0x30B6E091 ; 1.0.1E, 1.0.2U

; fw::Util::addMoney((int))
0x027F6C28 = lis r12, 0x3B9B
0x027F6C30 = addi r12, r12, -0x3601
0x027F6C3C = lis r3, 0x3B9B
0x027F6C40 = addi r3, r3, -0x3601

; fw::Util::setMoney((unsigned int))
0x027F6BA8 = lis r4, 0x3B9B
0x027F6BAC = addi r4, r4, -0x3601

; fw::Util::setTradeTicket((unsigned int))
0x027F6D00 = lis r0, 0x3B9A
0x027F6D04 = ori r0, r0, 0xC9FF

; fw::Util::setMiranium((unsigned int))
0x027F6D9C = lis r0, 0x3B9A
0x027F6DA0 = ori r0, r0, 0xC9FF

; fw::Util::addMiranium((int))
0x027F6DFC = lis r0, 0x3B9A
0x027F6E04 = ori r0, r0, 0xC9FF
0x027F6E14 = lis r12, 0x3B9B
0x027F6E18 = addi r12, r12, -0x3601

[XCX_MAXMONEY_1U] ##############################################################
moduleMatches = 0xAB97DE6B ; 1.0.1U

; fw::Util::addMoney((int))
0x027F6BAC = lis r12, 0x3B9B
0x027F6BB4 = addi r12, r12, -0x3601
0x027F6BC0 = lis r3, 0x3B9B
0x027F6BC4 = addi r3, r3, -0x3601

; fw::Util::setMoney((unsigned int))
0x027F6B2C = lis r4, 0x3B9B
0x027F6B30 = addi r4, r4, -0x3601

; fw::Util::setTradeTicket((unsigned int))
0x027F6C84 = lis r0, 0x3B9A
0x027F6C88 = ori r0, r0, 0xC9FF

; fw::Util::setMiranium((unsigned int))
0x027F6D20 = lis r0, 0x3B9A
0x027F6D24 = ori r0, r0, 0xC9FF

; fw::Util::addMiranium((int))
0x027F6D80 = lis r0, 0x3B9A
0x027F6D88 = ori r0, r0, 0xC9FF
0x027F6D98 = lis r12, 0x3B9B
0x027F6D9C = addi r12, r12, -0x3601

