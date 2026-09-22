{
  config,
  lib,
  pkgs,
  ...
}:

{
  # virtualisation.libvirtd.enable = true;
  virtualisation = {
    libvirtd.enable = true;
  };
  programs.virt-manager.enable = true;
}
