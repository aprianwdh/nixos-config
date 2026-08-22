description = "Nix Configuration";

inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  hyprland.url = "github:hyprwm/Hyprland/v0.55.0";
  
  # 1. TAMBAHKAN INI: Deklarasi sumber Home Manager
  home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};

# 2. TAMBAHKAN INI: Masukkan 'home-manager' ke dalam daftar argumen outputs
outputs = inputs @ { self, nixpkgs, hyprland, home-manager, ... }: {
  nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      ./configuration.nix
      ./hardware-configuration.nix
      
      # 3. TAMBAHKAN INI: Eksekusi modul Home Manager
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.backupFileExtension = "backup";
        
        # PENTING: Pastikan ini sesuai dengan nama user di sistemmu
        home-manager.users.enzwich = import ./home.nix;
      }
    ];
  };
};
