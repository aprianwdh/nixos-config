{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
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
    btop
    waypaper
    file-roller
    zip
    unzip
    p7zip
    bc
    wlogout
    mpvpaper
    mpv
    socat
    localsend
    yt-dlp
    godot
    opencode

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
    playerctl

    #gaming
    pcsx2
    xwayland-satellite
    protonplus
  ];
  programs.steam.enable = true;
}
