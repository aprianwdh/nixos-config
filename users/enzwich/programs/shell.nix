{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "foot";
  };

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "foot.desktop" ];
    };
  };
}
