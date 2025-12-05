{
  description = "Hyprland on Nixos";

  inputs = {
    # Official NixOS package source, using nixos's unstable branch by default
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # revert mesa to 25.2.6
    nixpkgs-mesa.url = "github:nixos/nixpkgs/2b1f0ea3ee3952e68b164efa0a1c5e394ef2e781";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";
    
    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nixos-apple-silicon, ... }: {
    nixosConfigurations.scott-lap-nixos = nixpkgs.lib.nixosSystem rec {
      system = "aarch64-linux";
      specialArgs = {
          inherit inputs;
          vars = {
              host = "scott-lap-nixos";
            };
        };
      modules = [
        ./modules/nixos/asahi.nix
        ./modules/nixos/default.nix
        #inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.scott = import ./home/home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}