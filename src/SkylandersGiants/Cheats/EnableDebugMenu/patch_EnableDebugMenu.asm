[SG_EnableDebugMenu]
moduleMatches = 0x62CC63A5, 0x71E3CF7E ; EUR, USA

0x02004E08 = li r6, 1 ; changes the value of param_4 in this call of tfbCore::tfbStreamMemoryConfiguration::getPlatformSetup to 1 to load the debug folder
0x02110098 = li r8, $game_config_value ; changes the Game Configuration