{
  description = "Hyprland on Nixos";

  inputs = {
    # Official NixOS package source, using nixos's unstable branch by default
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-unstable.url = "github:YaLTeR/niri";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
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
