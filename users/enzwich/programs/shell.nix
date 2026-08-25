{ pkgs, ... }:

{
  # shell zsh (paket & enable systemwide ada di modules/, ini bagian home-manager-nya
  # kalau nanti mau tambah plugin/alias zsh spesifik user, taruh di sini)
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
