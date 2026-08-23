# ❄️ NixOS Hyprland Dots

![NixOS](https://img.shields.io/badge/NixOS-23.11-blue.svg?style=for-the-badge&logo=NixOS&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-Dynamic_Tiling-black?style=for-the-badge&logo=hyprland&logoColor=white)

Welcome to my personal NixOS dotfiles repository. This repository contains my fully declarative `/etc/nixos` configuration, utilizing **Nix Flakes** and **Home Manager** with a strong focus on the **Hyprland** Wayland compositor.

## 🌟 Key Features

*   **Window Manager:** [Hyprland](https://hyprland.org/) (Wayland)
*   **System Management:** Nix Flakes & Home Manager
*   **Status Bar:** Waybar
*   **App Launcher:**  Rofi (Wayland)
*   **Terminal Emulator:** Foot
*   **Text Editor:** Neovim / VSCode

## 📂 Directory Structure

The repository is structured to be modular, readable, and easy to maintain:

```text
.
├── flake.nix             # Main entry point of the system configuration
├── flake.lock            # Lockfile for dependency versioning
├── configuration.nix     # Core system configuration (Boot, Network, Users, etc.)
├── hardware-configuration.nix # Auto-generated hardware specifics (Do not copy blindly!)
├── home.nix              # User-specific configuration via Home Manager
