{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  # settings untuk graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # keymap X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };

  # file manager & dconf
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  services.gvfs.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;
  environment.etc."xdg/xfce4/helpers.rc".text = ''
    TerminalEmulator=foot
  '';

  programs.firefox.enable = true;
  programs.starship.enable = true;

  # mengizinkan menjalankan binary non-nix (mis. untuk Mason di neovim)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
  ];

  fonts = {
    packages = with pkgs; [
      monocraft
      nerd-fonts.symbols-only # Ikon khusus logo
    ];

    fontconfig.defaultFonts = {
      monospace = [
        "Monocraft"
        "Symbols Nerd Font"
      ];
      sansSerif = [
        "Monocraft"
        "Symbols Nerd Font"
      ];
      serif = [
        "Monocraft"
        "Symbols Nerd Font"
      ];
    };
  };
}
