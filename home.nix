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
  };
in
{
  home.username = "enzwich";
  home.homeDirectory = "/home/enzwich";
  home.stateVersion = "26.05";

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;

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
      name = "Catppuccin-Mocha-Standard-Mauve-Dark";
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
  };

  # VSCODIUM DI SINI
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium; 
    
    extensions = with pkgs.vscode-extensions; [
      # --- TEMA ---
      catppuccin.catppuccin-vsc
      
      # --- NIXOS ---
      jnoortheen.nix-ide       # Wajib untuk syntax highlight dan formatting file .nix

      # --- PYTHON ---
      ms-python.python         # Standar wajib untuk linting, debugging, dan auto-complete Python
      ms-pyright.pyright
      
      # --- JAVASCRIPT & WEB ---
      esbenp.prettier-vscode   # Sangat membantu merapikan kode JS, HTML, dan CSS
      dbaeumer.vscode-eslint   # Linter untuk mencari error di JavaScript

      # --- ALGORITMA & PRODUKTIVITAS BELAJAR ---
      usernamehw.errorlens     # Memunculkan pesan error langsung di baris kode (sangat cocok untuk debugging tugas pemrograman)
      oderwat.indent-rainbow   # Mewarnai indentasi, sangat membantu saat menulis Python agar tidak error karena salah spasi
      eamodio.gitlens
    ];

    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha"; 
      "catppuccin.accentColor" = "mauve"; 
      # Auto-format saat file disave
      "editor.formatOnSave" = true;
      "[nix]"."editor.defaultFormatter" = "jnoortheen.nix-ide";
      "[python]"."editor.defaultFormatter" = "ms-python.python";
      # Mengatur Pyright sebagai Language Server utama
      "python.languageServer" = "None"; # Nonaktifkan default jika murni memakai ekstensi pyright terpisah
      "pyright.disableLanguageServices" = false;
      "python.analysis.typeCheckingMode" = "basic";
    };
  };

  home.file.".zshrc".source = create_symlink "${dotfiles}/.zshrc";
}