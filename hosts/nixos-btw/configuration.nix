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

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname & networking
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  services.displayManager.ly.enable = true;

  # Definisi user. Jangan lupa set password dengan `passwd`.
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
  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  # Nilai ini menentukan rilis NixOS untuk kompatibilitas data stateful
  # (lokasi file, versi database, dst). Aman dibiarkan pada versi rilis
  # instalasi pertama sistem ini — jangan diubah tanpa baca dokumentasinya.
  system.stateVersion = "26.05";
}
