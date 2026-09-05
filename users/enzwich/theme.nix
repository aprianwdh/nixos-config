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
      /* Palet Warna Global */
      @define-color theme_selected_bg_color rgba(205, 214, 244, 0.20);
      @define-color theme_selected_fg_color rgb(205, 214, 244);

      /* 1. Latar Belakang Utama, Sidebar, dan Toolbar (Murni Base) */
      .thunar,
      .thunar .view,
      .thunar .sidebar,
      .thunar .sidebar .view,
      .thunar toolbar,
      .thunar menubar,
      .thunar statusbar {
          background-color: rgba(30, 30, 46, 0.90);
          color: rgb(205, 214, 244);
          border: none;
      }

      /* 2. Pathbar / Input Lokasi Folder */
      .thunar entry,
      .thunar .path-bar,
      .thunar .path-bar button {
          background-color: rgba(30, 30, 46, 0.95);
          color: rgb(205, 214, 244);
          border: 1px solid rgba(205, 214, 244, 0.20);
          border-radius: 4px;
      }

      .thunar .path-bar button:checked,
      .thunar .path-bar button:active {
          background-color: rgba(205, 214, 244, 0.20);
          color: rgb(205, 214, 244);
      }

      /* 3. Menu Dropdown (File, Edit, View, dll) */
      menu,
      .menu,
      menubar menu {
          background-color: rgba(30, 30, 46, 0.98);
          color: rgb(205, 214, 244);
          border: 1px solid rgba(205, 214, 244, 0.20);
          padding: 4px;
      }

      /* Item di dalam Menu saat disorot / diklik */
      menuitem:hover,
      menuitem:selected,
      menubar > menuitem:hover,
      menubar > menuitem:selected {
          background-color: rgba(205, 214, 244, 0.20);
          color: rgb(205, 214, 244);
          border-radius: 4px;
      }

      /* Checkbox & Radio Button di dalam Menu */
      menu check:checked,
      menu radio:checked {
          background-color: rgba(205, 214, 244, 0.30);
          color: rgb(205, 214, 244);
          border-color: rgba(205, 214, 244, 0.50);
      }

      /* 4. Seleksi Item / Folder pada Grid */
      .thunar .view:selected,
      .thunar .view text:selected,
      .thunar iconview:selected,
      .thunar .sidebar .view:selected {
          background-color: rgba(205, 214, 244, 0.20);
          color: rgb(205, 214, 244);
          border: 1px solid rgba(205, 214, 244, 0.40);
          border-radius: 6px;
      }

      /* 5. Kotak Seleksi Drag Mouse (Rubberband) & Hover */
      .thunar .rubberband,
      rubberband {
          background-color: rgba(205, 214, 244, 0.15);
          border: 1px solid rgba(205, 214, 244, 0.35);
      }

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
