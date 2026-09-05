{ config, pkgs, ... }:

{
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  gtk = {
    enable = true;
    font = {
      name = "Monocraft";
      size = 13;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "black";
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk3.extraCss = ''
      /* 1. Global GTK Highlight (Hanya turunan Text) */
      @define-color theme_selected_bg_color rgba(205, 214, 244, 0.20);
      @define-color theme_selected_fg_color rgb(205, 214, 244);

      /* 2. Seluruh Area Latar Belakang (Murni Base) */
      .thunar,
      .thunar .view,
      .thunar .sidebar .view,
      .thunar toolbar,
      .thunar menubar,
      .thunar statusbar {
          background-color: rgba(30, 30, 46, 0.90);
          color: rgb(205, 214, 244);
          border: none;
      }

      /* 3. Efek Saat Folder/File Diklik / Terpilih (Murni Text transparan) */
      .thunar .view:selected,
      .thunar .view text:selected,
      .thunar iconview:selected,
      .thunar .sidebar .view:selected {
          background-color: rgba(205, 214, 244, 0.20);
          color: rgb(205, 214, 244);
          border: 1px solid rgba(205, 214, 244, 0.40);
          border-radius: 6px;
      }

      /* 4. Kotak Seleksi Mouse (Rubberband) */
      .thunar .rubberband,
      rubberband {
          background-color: rgba(205, 214, 244, 0.15);
          border: 1px solid rgba(205, 214, 244, 0.35);
      }

      /* 5. Hover Mouse (Sorot Tipis) */
      .thunar .view:hover {
          background-color: rgba(205, 214, 244, 0.08);
      }
    '';
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
