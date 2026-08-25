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
    swappy = "swappy";
    fastfetch = "fastfetch";
  };
in
{
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.file.".zshrc".source = create_symlink "${dotfiles}/.zshrc";
}
