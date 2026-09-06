{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  # Get the path to generated Wayland session desktop entries
  sessionsDir = "${config.services.displayManager.sessionData.desktops}/share";
in

{
  imports = [
    ../../modules/desktop.nix
    ../../modules/audio.nix
    ../../modules/packages.nix
    ../../modules/locale.nix
    ../../modules/nix-settings.nix
  ];

  # Boot
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname & networking
  networking.hostName = "nixos-btw";
  networking.networkmanager.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        # command = "${lib.getExe pkgs.tuigreet} --time --asterisks --remember --remember-session --sessions ${sessionsDir}/wayland-sessions";
        command = "${lib.getExe pkgs.tuigreet} --time --asterisks --remember --remember-session --cmd 'uwsm start niri-uwsm.desktop'";

      };
    };
  };

  users.users.greeter = {
    isNormalUser = false;
    extraGroups = [ "seat" ];
  };

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

  system.stateVersion = "26.05";
}
