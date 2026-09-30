{
  config,
  lib,
  pkgs,
  ...
}:

{
  #virtualisation.virtualbox.host.enable = true;
  #users.extraGroups.vboxusers.members = ["nixos-btw"];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
}
