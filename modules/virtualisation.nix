{ config, lib, pkgs, ...}:

{
  # virtualisation.libvirtd.enable = true;
  virtualisation = {
    libvirtd.enable = true;
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
    };
    oci-containers.backend = "podman";
    
    oci-containers.containers."9router" = {
      image = "decolua/9router:latest";
      ports = [ "11434:11434" ];
    };
  programs.virt-manager.enable = true;
}
