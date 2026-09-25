{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["nixos-btw"];
}
