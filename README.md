# ❄️ NixOS Hyprland Dots

![NixOS](https://img.shields.io/badge/NixOS-23.11-blue.svg?style=for-the-badge&logo=NixOS&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-Dynamic_Tiling-black?style=for-the-badge&logo=hyprland&logoColor=white)

Welcome to my personal NixOS dotfiles repository. This repository contains my fully declarative `/etc/nixos` configuration, utilizing **Nix Flakes** and **Home Manager** with a strong focus on the **Hyprland** Wayland compositor.

## 🌟 Key Features

- **Window Manager:** [Hyprland](https://hyprland.org/) (Wayland)
- **System Management:** Nix Flakes & Home Manager
- **Status Bar:** Waybar
- **App Launcher:** Rofi (Wayland)
- **Terminal Emulator:** Foot
- **Text Editor:** Neovim / VSCode

## 📂 Directory Structure

The repository is structured to be modular, readable, and easy to maintain:

```text

/etc/nixos/
├── flake.nix
├── hosts/
│   └── nixos-btw/
│       ├── configuration.nix
│       └── hardware-configuration.nix   # tempel milikmu yang lama di sini
├── modules/
│   ├── desktop.nix        # graphics, hyprland, xkb, thunar, firefox, nix-ld
│   ├── audio.nix           # pipewire
│   ├── locale.nix          # timezone & i18n
│   ├── nix-settings.nix    # nix.settings & nix.gc
│   └── packages.nix        # environment.systemPackages
└── users/
    └── enzwich/
        ├── home.nix         # entry point, tinggal import file lain
        ├── dotfiles.nix     # symlink dotfiles + cliphist
        ├── theme.nix        # gtk/cursor/dconf catppuccin
        └── programs/
            ├── shell.nix
            └── vscodium.nix
```
