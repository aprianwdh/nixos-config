{
  description = "nixos-btw";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland/v0.56.0";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    scroll-overview = {
      url = "github:yayuuu/hyprland-scroll-overview";
      inputs.hyprland.follows = "hyprland";
    }
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      hyprland,
      home-manager,
      nix-cachyos-kernel,
      scroll-overview,
      ...
    }:
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-btw/configuration.nix
          ./hosts/nixos-btw/hardware-configuration.nix

          home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit inputs; };

            # PENTING: samakan dengan nama user di sistemmu
            home-manager.users.enzwich = import ./users/enzwich/home.nix;
          }
        ];
      };

      # jalankan `nix fmt` untuk merapikan semua file .nix
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
    };
}
