{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../modules/desktop.nix
    ../../modules/audio.nix
    ../../modules/packages.nix
    ../../modules/locale.nix
    ../../modules/nix-settings.nix
  ];

  # Boot
  #boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto-x86_64-v3;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname & networking
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  services.displayManager.ly.enable = true;

  zramSwap.enable = true;

  # Definisi user
  users.users."enzwich" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Mr_Enzwich";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = with pkgs; [ ];
  };

  programs.zsh.enable = true;
  programs.gamemode.enable = true;
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  # Nilai ini menentukan rilis NixOS untuk kompatibilitas data stateful
  system.stateVersion = "26.05";
}
