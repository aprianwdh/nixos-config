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

  # Niri
  programs.niri.enable = true;
  programs.uwsm = {
    enable = true;
    waylandCompositors.niri = {
      prettyName = "Niri";
      comment = "Niri compositors managed by UWSM";
      binPath = "${pkgs.niri}bin/niri";
    };
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
