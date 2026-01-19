[STT_EnableDebugMenu_v16]
moduleMatches = 0x2A14BB42 ; v16

0x02003F1C = li r6, 1 ; changes the value of param_4 in this call of tfbCore::tfbStreamMemoryConfiguration::getPlatformSetup to 1 to load the debug folder
0x02100840 = li r8, $game_config_value ; changes the Game Configuration

[STT_EnableDebugMenu_v0]
moduleMatches = 0x321D97F0 ; v0

0x02003F1C = li r6, 1 ; changes the value of param_4 in this call of tfbCore::tfbStreamMemoryConfiguration::getPlatformSetup to 1 to load the debug folder
0x02100DAC = li r8, $game_config_value ; changes the Game Configuration