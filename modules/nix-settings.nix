{ ... }:

{
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
    extra-substituters = [ ];
    extra-trusted-public-keys = [ ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };
}
