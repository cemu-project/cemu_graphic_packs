About presets with [FORCED]:
It's a bit tough to explain, but here's how the game selects the chest quality:
 1) Calculate luck for gold chest, if success exit with gold quality (1), else process next step
 2) Calculate luck for silver chest, if success exit with silver quality (2), else process next step
 3) Calculate luck for bronze chest, if success exit with bronze quality (3), else process next step
 4) No chest at all, exit with no chest (0)
 --> By default, the mod only changes this last step. So even if you put value 1 (gold chest), you'll still get a silver chest if the game succeeded the step 2. That means quests which forces a quest quality will not be broken.

But presets with [FORCED] will always give you the wanted treasure quality. This is very usefule for loot grinding, but can break quests whose need a different quality.