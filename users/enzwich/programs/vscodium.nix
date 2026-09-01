{ pkgs, ... }:

{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # --- TEMA ---
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        # --- NIXOS ---
        jnoortheen.nix-ide

        # --- PYTHON ---
        ms-python.python
        ms-pyright.pyright
        ms-python.black-formatter

        # --- JAVASCRIPT & WEB ---
        esbenp.prettier-vscode
        dbaeumer.vscode-eslint

        # --- LUA ---
        sumneko.lua
        # --- ALGORITMA & PRODUKTIVITAS BELAJAR ---
        usernamehw.errorlens
        oderwat.indent-rainbow
        eamodio.gitlens
      ];

      userSettings = {
        # fonts
        "editor.fontFamily" = "'Monocraft', 'Symbols Nerd Font', monospace";
        "editor.fontSize" = 13;
        "editor.fontLigatures" = false;

        # telematery (palacakan)
        "telemetry.telemetryLevel" = "off";

        # theme
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
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

        # lua hyprland settings
        "Lua.workspace.library" = [
          "/run/current-system/sw/share/hypr/stubs"
        ];
        "Lua.diagnostics.globals" = [ "hl" ];
      };
    };
  };
}
