{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim # Jangan lupa siapkan editor untuk edit configuration.nix! Nano juga terpasang default.
    tree
    git
    gh
    foot
    gcc
    lua-language-server
    nil
    nixfmt
    wget
    nitch
    rofi
    adwaita-icon-theme
    fastfetch
    gnumake
    ripgrep
    fd
    vscodium
    pavucontrol
    waybar
    hyprpaper
    btop
    waypaper
    nwg-displays

    # untuk nvim
    unzip
    nodejs_22
    python3
    cargo
    sqlite

    # integrasi pencarian
    lazygit
    fzf

    # untuk screenshot
    grim
    slurp
    swappy
    wl-clipboard

    # audio & visual
    wireplumber
    brightnessctl

    #gaming
    pcsx2
  ];
}
