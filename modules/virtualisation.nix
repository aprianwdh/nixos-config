{
  config,
  lib,
  pkgs,
  ...
}:

{
  # #virtualisation.virtualbox.host.enable = true;
  # #users.extraGroups.vboxusers.members = ["nixos-btw"];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };

  programs.virt-manager.enable = true;
}
