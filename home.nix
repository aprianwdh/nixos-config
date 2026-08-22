{ config, pkgs, ... }:
let
  # Sesuaikan path ini dengan lokasi folder dotfiles-mu yang sebenarnya
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  # Daftar folder yang mau di-symlink ke ~/.config/
  configs = {
    waybar = "waybar";
    rofi = "rofi";
  };
in
{
  home.username = "enzwich";
  home.homeDirectory = "/home/enzwich";
  home.stateVersion = "26.05"; # Sesuaikan dengan versimu

  # Ini yang bertugas membuat symlink dotfiles
  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
