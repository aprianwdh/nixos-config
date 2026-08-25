{ config, pkgs, ... }:

{
  imports = [
    ./dotfiles.nix
    ./theme.nix
    ./programs/shell.nix
    ./programs/vscodium.nix
  ];

  home.username = "enzwich";
  home.homeDirectory = "/home/enzwich";
  home.stateVersion = "26.05";
}
