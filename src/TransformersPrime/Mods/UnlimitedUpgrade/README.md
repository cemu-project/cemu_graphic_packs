# Transformers: Prime — Unlimited Upgrade Mode

A configurable gameplay modification for **Transformers: Prime – The Game** on the Cemu Wii U emulator.

This mod allows human-controlled Transformers to use Unlimited Upgrade Mode, including infinite Upgrade Energy, unlimited transformation duration, and the ability to manually activate or deactivate Upgrade Mode using the **L button**.

It also introduces optional multiplayer settings that can give CPU-controlled Transformers unlimited Upgrade Mode, creating more challenging battles.

All features can be configured through Cemu's Graphics Packs menu.

## Features

### Unlimited Upgrade Mode for Human Players

- Begin supported battles with a full Upgrade Energy gauge.
- Activate Upgrade Mode using the original L-button control.
- Remain upgraded indefinitely.
- Press L again to return to normal.
- Reactivate Upgrade Mode whenever desired.
- Supports multiple human players independently in multiplayer.

### Human Upgrade Mode Settings

| Preset | Behavior |
|---|---|
| Story + Multiplayer | Unlimited Upgrade Mode in both modes |
| Story Mode Only | Unlimited Upgrade Mode in Story Mode; normal multiplayer mechanics for humans |
| Multiplayer Only | Normal Story Mode mechanics; Unlimited Upgrade Mode for multiplayer humans |
| Off | Original Upgrade mechanics for human players |

### Multiplayer CPU Rules

**Squash Match (Normal CPU)**

CPU-controlled Transformers retain their original Upgrade mechanics:

- Begin with their normal starting energy.
- Charge the Upgrade gauge through gameplay.
- Consume energy when transforming.
- Return to normal when the original Upgrade timer expires.
- Follow the game's existing AI decisions.

**Full Upgrade Mayhem**

CPU-controlled Transformers receive enhanced Upgrade capabilities:

- Begin multiplayer battles with full Upgrade Energy.
- Activate Upgrade Mode when their existing AI chooses.
- Remain upgraded indefinitely once transformed.
- Retain their original combat AI and decision-making.

These CPU settings operate independently of the Human Upgrade Mode setting.

### Ultimate Challenge

For players seeking an especially difficult battle:

- Set **Human Upgrade Mode** to **Off**.
- Set **Multiplayer CPU Rules** to **Full Upgrade Mayhem**.

Human players retain their normal Upgrade mechanics while CPU-controlled opponents can remain permanently upgraded.

This configuration also supports battles involving multiple CPU opponents.

## Compatibility

- **Game:** Transformers: Prime – The Game
- **Platform:** Wii U
- **Emulator tested:** Cemu 2.6
- **Game region:** USA
- **Game version:** v0
- **Title ID:** `000500001010B500`
- **Module checksum:** `0x926B35F7`

Other game regions, revisions, and emulator versions have not been verified.

## Installation

1. Install the community graphic pack through Cemu when available, or manually place the pack folder inside Cemu's `graphicPacks` directory.
2. Open **Options → Graphic Packs**.
3. Find **Transformers Prime → Mods → Unlimited Upgrade Mode**.
4. Enable the graphics pack.
5. Select the desired Human Upgrade Mode and Multiplayer CPU Rules presets.
6. Start the game.

Restart the game after changing presets so that the updated assembly configuration is applied.

Avoid enabling another version of this modification simultaneously.

## Controls

| Action | Control |
|---|---|
| Activate Upgrade Mode | L |
| Deactivate Upgrade Mode while upgraded | L again |
| Reactivate Upgrade Mode | L |

Manual deactivation applies to human-controlled fighters when Unlimited Upgrade Mode is enabled.

## Testing

The modification has been manually tested in Cemu 2.6, including:

- Story Mode combat and Upgrade Mode activation/deactivation.
- Independent unlimited Upgrade Mode for two human players.
- Human-versus-CPU multiplayer.
- One human player against three CPU opponents.
- Two human players against two CPU opponents.
- Original CPU energy consumption and transformation duration.
- Full Upgrade Mayhem with multiple CPU fighters.
- Story-only, multiplayer-only, combined, and disabled human settings.
- Normal human abilities against indefinitely upgraded CPU opponents.

The tested configurations behaved as intended. This does not guarantee compatibility with every game revision or scenario.

## Limitations

- Vehicle-only stages retain their original restrictions on Upgrade Mode.
- Full Upgrade Mayhem is intended for multiplayer CPU fighters, not Story Mode enemies.
- This modification changes Upgrade-related gameplay behavior and is not intended as a competitive balance adjustment.
- Compatibility outside the tested US v0 version is not established.

## Development

This modification was developed through reverse-engineering and debugging the game's PowerPC gameplay instructions, with AI-assisted code development and manual in-game testing.

The goal is to provide players with greater freedom over Upgrade Mode while preserving the original game mechanics whenever a particular modification is disabled.
