# Description of the mods for Xenoblade Chronicles X
### Battle mods

- **Automatic Soul Challenges**: The Soul Challenges QTE are hidden and automatically successful (only affect ground battles , not the QTE on Skell binding and destroying).
- **Enemy Statistics mod**: Apply a global percent modificator on all enemies stats (HP, Melee Attack, Melee Accuracy, Ranged Attack, Ranged Accuracy, Potential and Evasion).
- **Escape distance reducer**: Reduce escape distance needed to lose aggro from enemies.
- **Ground Damage multiplicator**: Increase the ground damage dealt by your team (skells not impacted).
- **Overdrive unlocked**: Overdrive is unlocked from the beginning of the game.

### BLADE mods
- **DLC quests unlocked**: DLC Support quests are unlocked and accessible as soon as you become a BLADE member.
- **Gain Reward Tickets from DLC or Time Attack missions**: Add Exchange Tickets in reward of completing Blade missions. There is 2 presets: one which adds tickets to Time Attack missions (same amount that the experience) and another which adds tickets to DLC missions (amount is money divided by 100).
- **Lv60 skells unlocked (+cheat)**: Unlock the post-game skells and equipment as soon as you become a BLADE member (it also considers you have a Skell Flight License). The "Cheat" preset ignores all requirements for crafting. Yes, that means you can get an Ares 90 for free, right after Chapter 2!
- **More Reward Tickets**: Increase the amount of Tickets you get from Squad tasks and missions. Presets with "uncapped" means they ignore the max amount of Tickets you can have.
- **Offline Squad tasks and missions**: Squad tasks and missions become available for offline play! When the game starts, a Squad quest is randomly selected (with "Random" preset) and the timer is stopped.
    > Other presets allow to choose a specific tasks list.  (c ) stands for collectible and (t) for Tyrant.
    > With "Random" preset, you can change the tasks list with the main menu, Social entry and "Select Squad" entry.

### Collectibles mods
- **Catch range mod**: Increase the distance from which you catch a collectible. By default, you'll get them just when you're close enough to see the blue gem (distance increased by 40.0). There are 3 kind of distances in the game, each with a value of "Range" and "Height": "Inner" (which means when you are at foot), "Doll" (when you have a Skell at land) and "Flight" (which I believe is when you flight, generally in a Skell). All values are editable in the file patches.txt. Also note that the rarity of items is untouched.
- **Ignore 100th**: Prevent from catching a collectible when you already have 99 of them, and doesn't sell it. This is for endgame runs in which you have plenty of money, many collectibles and doesn't want to be spammed with selling messages when you walk around in the world.

### Equipment mods
- **Armors can have 3 augment slots**: Using L' shop, you can have a maximum of 3 augment slots on any of your **equipped** ground or skell armor (right now this won't work on unequipped).
- **Unlimited augment upgrades**: Allow you to infinitely upgrade all the augments inside a piece of equipment (as long as you have the resources of course). The "Cheat" preset ignores all requirements. **Warning**: with low level armors the max level for augments is 17, if you try to upgrade once more you'll get back to level 1! So far I was unable to understand this strange behavior.
- **Unlock all augments**: All augments are known in the BLADE shop. As usual, the "Cheat" preset ignores all requirements for crafing (useful for build testing).

### Experience mods
- **Battle Points X**: Increase the battle points gained when a new level (or class level) is reached, when completing missions or when exploring.
- **BLADE Points X**: Increase the Blade points gained in various situations.
- **Class Exp Points X**: Increase the class experience points gained in battles, missions, quests and exploration.
- **Friend Points X**: Increase the friend points gained during Soul Voice activation in battles.
- **Inner Exp Points X**: Increase the experience points gained in battles, missions, quests and exploration.

### FrontierNav mods
- **Miranium income frequency**: Increase the frequency of the FrontierNav Miranium.
- **Miranium income quantity**: Increase the quantity of Miranium gained using FrontierNav.
- **Money income frequency/quantity**: Those 2 mods do the same for money.
- **Resources income frequency/quantity**: Those 2 mods do the same for the resources.

### Graphics mods
- **Camera distance mod**: Allow to change the default zoom (which is reset after most cutscenes and this was boring me).
- **NPC info bubbles distance mod**: Increase the distance from which NPC's yellow speech bubbles are seen. I made this mod to get rid of the frustration not being able to get information from NLA people unless I get very close to each one of them.

### HUD mods
- **Change time at will**: Allow to change time of the day from the eManual entry of the main menu.

### Loot mods
- **Equipment - Always best quality**: Equipment looted is always at best quality ("Prime" for ground gear and "Intergalactic" for Skells gear), with "X6X" variants and has always 3 augments and 3 extra free slots.
- **Equipment - Force count**: Force the number of equipments looted in silver of gold treasures.
- **Equipment - Force type**: Force the type of equipment you loot. This mod is designed to make end-game equipment farming easier. **Doesn't work for Skells weapons!**
- **Equipment - Ignore broken**: Get rid of those broken equipments!
- **Materials - Drop ratio mod**: Set a minimum drop ratio for materials.
- **Treasure Quality**: Select the treasure quality you want to loot (bronze, silver, gold or no chest at all if you just want to kill a lot of monsters quickly without loot).    
    > Difference between regular and "FORCED" presets:    
    > It's a bit tricky to explain, but here's how the game selects the chest quality:    
    > 1 - Calculate luck for gold chest, if success exit with gold quality, else process next step    
    > 2 - Calculate luck for silver chest, if success exit with silver quality, else process next step    
    > 3 - Calculate luck for bronze chest, if success exit with bronze quality, else process next step    
    > 4 - Bad luck, exit with no chest    
    > Regular presets of this mod only change the last step. So even if you select the "Gold quality" preset, you'll still get a silver chest if the game succeeded the step 2.    
    > FORCED presets bypass the entire process, so that you'll be guaranteed to get gold chests, but the downtime is that **it can break some quests** which require you to loot key items that appear only in bronze or silver treasures!    
    > **My advice**: only use "FORCED" presets for end-game farming.

### Music mods
- **No Overdrive music**: Disables the Overdrive music (after some time using Overdrive a lot during battles, I missed the other musics, especially the one from tyrants).
- **No Skell Flight music**: Disables the flight music (at the beginning the music is awesome, but after some time I wanted to listen to the field musics again).

### Physics mods
- **Jump to the Moon!**: Increases the horizontal and vertical velocity of the jump (vanilla values are 1.0 for both).
- **Run Forrest, run!**: Increases the speed of sprinting.

### Weather mods
- **Force weather**: Force selected weather. Just select a preset and unload/reload the pack.

### Requirements
The most important requirement is of course Cemuhook. All my mods have been tested and are known to work with Cemuhook **0.5.7.3**.
All mods are compatibles with Xenoblade versions **1.0.1E** and **1.0.2U** (some of them with 1.0.1U), and are not supposed to impact savegames but be sure to make save backup just in case!
