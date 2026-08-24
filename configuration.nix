{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # HostName
  networking.hostName = "nixos-btw"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  services = {
    displayManager = {
      ly.enable = true;
    };
  };
  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  #settings untuk graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  #untuk mengaktifkan pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; # Ini membuat aplikasi lama mengira kamu masih pakai PulseAudio
  };
  services.pulseaudio.enable = false;

  services.cliphist = {

    enable = true;

    # A Wayland session
    systemdTargets = [ "config.wayland.systemd.target" ];

    extraOptions = [
      "-max-dedupe-search"
      "10"
      "-max-items"
      "500"
    ];
    allowImages = true;

  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."enzwich" = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Mr_Enzwich";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
    packages = with pkgs; [ ];
  };

  #shell zsh
  programs.zsh.enable = true;

  #starship
  programs.starship.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #browser firefox
  programs.firefox.enable = true;

  # List packages installed in system:
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    tree
    git
    gh
    foot
    gcc
    lua-language-server
    nil
    alejandra
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
    nixfmt
    #untuk nvim
    unzip
    nodejs_22
    python3
    cargo
    sqlite
    #integrasi pencarian
    lazygit
    fzf
    #utuk screnshoot
    grim
    slurp
    swappy
    wl-clipboard
    #audio & visual
    wireplumber
    brightnessctl
  ];

  #menjalankan thunar dan dconf
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;

  #menjalankan Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = true;
  };

  #mengizinkan menjalankan program untuk Mason
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    download-buffer-size = 268435456;
    trusted-users = [
      "root"
      "enzwich"
    ];
    extra-substituters = [ "https://hyprland.cachix.org" ];
    extra-trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
