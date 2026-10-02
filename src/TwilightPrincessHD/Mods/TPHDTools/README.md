# TPHD Tools for Cemu

## Controls

The menu is hidden when the game starts. Press `ZR + D-Pad Down` to open or
close it. Button names below refer to the emulated Wii U controller configured
in Cemu; keyboard and third-party-controller inputs depend on your Cemu input
profile.

### Menu controls

| Input | Action |
| --- | --- |
| D-Pad | Navigate |
| A | Select, activate, or edit |
| B | Cancel or go back |
| X | Open the window picker |
| Y | Cycle focus between the menu bar and open tool windows |
| L / R | Change tabs in the focused window |
| Hold ZL + right stick | Move the focused window |
| Hold ZL + left stick | Resize the focused window |
| GamePad touchscreen or Cemu mouse | Point, select, move, and resize |

### Default hotkeys

Feature-specific hotkeys only act while their corresponding feature is enabled.
All hotkeys can be changed under **Settings > Rebind Hotkeys**.

| Hotkey | Action |
| --- | --- |
| ZR + D-Pad Down | Open or close the menu |
| Plus + X + B | Reset the game when the reset hotkey is enabled |
| ZL + ZR + Plus | Reload the last Save Loader state when that option is enabled |
| ZR + Y | Quick Transform |
| ZL + ZR + L3 + R3 | Toggle Fly Cam |
| Hold ZR + A | Moon Jump |
| ZR + D-Pad Left | Save Link and camera coordinates |
| ZR + D-Pad Right | Load saved coordinates in the same stage |
| ZR + L3 | Detonate player-created bombs while Remote Bombs is enabled |

### Fly Cam controls

Enable Fly Cam from **Camera & HUD**, then use its hotkey to enter fly mode.

| Input | Action |
| --- | --- |
| Left stick | Move |
| Right stick | Rotate |
| ZL / ZR | Move down / up |
| L / R | Decrease / increase movement speed |
| Hold A / B | Use maximum / minimum movement speed |
| L3 | Exit and return the camera to Link |
| R3 | Exit and move Link to the camera |

Settings and hotkey changes are saved in `sd:/tphd_tools/config.json` within
Cemu's emulated SD-card storage.
