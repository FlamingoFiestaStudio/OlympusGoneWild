# OlympusGoneWild

Welcome to the repository for our Godot 4 game project! This README will guide you through setting up the project, provide information on branch naming conventions, Godot version compatibility, and an overview of the directory structure. Additionally, we use priority labels to help organize and prioritize tasks.

## Setting Up the Project

To manage the Godot version for this project, we recommend using the [Godot Version Manager](https://github.com/noidexe/godot-version-manager/releases/download/v1.13/Godot.Version.Manager.v1.13-win.zip) or check their repository for further questions [Repository Link](https://github.com/noidexe/godot-version-manager/releases/tag/v1.13). Download and install this manager to easily control the Godot version used for development.

1. Download and install the Godot Version Manager from the provided link.
2. Initialize a new project using Godot 4.0.4 stable.
3. Clone this repository into your project directory.

## Branch Naming Convention

Please follow this branch naming convention when creating branches for new features, bug fixes, or tasks:

`{number of the ticket}-name-of-the-ticket`

For example, if you are working on ticket number 42, the branch name should be:

`42-implement-player-movement`

## Priority Labels

We use the following priority labels to help organize and prioritize tasks:

- **P1 (Highest Priority)**: Critical tasks or issues that require immediate attention.
- **P2**: High-priority tasks that need to be addressed soon.
- **P3**: Medium-priority tasks that can be scheduled based on the project's needs.
- **P4**: Low-priority tasks or nice-to-have features that can be worked on when time allows.

## Godot Version

This project is compatible with Godot 4.0.4 stable. Make sure you have set up the correct Godot version using the Godot Version Manager as mentioned above.

## Directory Structure

Here's an overview of the project's directory structure:

- `/`: Root directory
- `/entities`: Contains subdirectories for various game entities and characters.
  - `/player`: Contains files related to the player character.
    - `player.tscn`: The scene file for the player character.
    - `player.gd`: The script for the player character.
  - `/enemies`: Contains enemy-related files.
    - `generic_enemy.gd`: Script for a generic enemy.
    - `enemy.tscn`: Base scene for enemies (to be overridden).
    - `boss_enemy.gd`: Script for a boss enemy.
    - `boss.tscn`: Base scene for boss enemies (to be overridden).
  - `actor.tscn`: A scene file for a generic actor.
  - `actor.tres`: A resource file for the actor.
  - `actor.gd`: A script for the actor.
- `/globals`: Contains autoloaded global resources.
  - `notifications.tscn`: Scene for handling notifications.
  - `lobby.tscn`: Scene for the game's lobby.
  - `serialization.tscn`: Scene for handling serialization.
- `/menus`: Contains scenes for standalone 2D menus or popups.
  - `/title`: Subdirectory for title screen-related files.
    - `title.tscn`: Scene for the title screen.
    - `font_title.tres`: Resource file for the title screen's font.
  - `/ui`: Contains UI-related assets that are reused.
    - `/theme_default`: Subdirectory for the default UI theme.
      - `/assets`: Contains UI-related image assets.
      - `theme_default.tres`: Resource file for the default UI theme.
    - `font_uidefault.tres`: Resource file for the default UI font.
    - `cool_font.ttf`: An additional font file.
- `/scenes`: Contains game scenes where players are instantiated.
  - `/common`: Common game scenes and assets.
    - `/assets`: Common assets used in various scenes.
    - `/prefabs`: Premade designs for inclusion in other scenes.
    - `common_gridmap.tres`: Resource file for a common grid map.
  - `/main`: The main game scene and associated assets.
  - `/overworld`: The overworld game scene and assets.
  - `/dungeon`: The dungeon game scene and assets.

Feel free to explore and contribute to the project following the provided directory structure.

If you have any questions or need further assistance, please don't hesitate to reach out to the project team. Happy game development! 🎮🚀
