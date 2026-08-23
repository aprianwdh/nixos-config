{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    waybar = "waybar";
    rofi = "rofi";
    foot = "foot";
    hypr = "hypr";
    "starship.toml" = "starship.toml";
  };
in
{
  home.username = "enzwich";
  home.homeDirectory = "/home/enzwich";
  home.stateVersion = "26.05";

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "catppuccin-mocha-mauve-cursors";
    package = pkgs.catppuccin-cursors.mochaMauve;
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };
    cursorTheme = {
      name = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
  };

  # VSCODIUM DI SINI
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium; 
    
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha"; 
      "catppuccin.accentColor" = "mauve"; 
    };
  };

  home.file.".zshrc".source = create_symlink "${dotfiles}/.zshrc";
}