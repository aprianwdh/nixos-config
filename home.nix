{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    waybar = "waybar";
    rofi = "rofi";
    foot = "foot";
    hypr = "hypr";
    "starship.toml" = "starship.toml";
    swappy = "swappy";
  };
in
{
  home.username = "enzwich";
  home.homeDirectory = "/home/enzwich";
  home.stateVersion = "26.05";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "catppuccin-mocha-mauve-cursors";
    package = pkgs.catppuccin-cursors.mochaMauve;
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };
    cursorTheme = {
      name = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # VSCODIUM
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # --- TEMA ---
        catppuccin.catppuccin-vsc

        # --- NIXOS ---
        jnoortheen.nix-ide

        # --- PYTHON ---
        ms-python.python
        ms-pyright.pyright
        ms-python.black-formatter

        # --- JAVASCRIPT & WEB ---
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint

        # --- ALGORITMA & PRODUKTIVITAS BELAJAR ---
        usernamehw.errorlens
        oderwat.indent-rainbow
        eamodio.gitlens
      ];

      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
        "catppuccin.accentColor" = "mauve";

        # Auto-format saat file disave
        "editor.formatOnSave" = true;
        "nix.formatterPath" = "nixfmt";
        "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
        "[python]"."editor.defaultFormatter" = "ms-python.black-formatter";

        # Mengatur Pyright sebagai Language Server utama
        "python.languageServer" = "None";
        "pyright.disableLanguageServices" = false;
        "python.analysis.typeCheckingMode" = "basic";
      };
    };
  };

  home.file.".zshrc".source = create_symlink "${dotfiles}/.zshrc";
}
