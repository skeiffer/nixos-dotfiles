{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixos-apple-silicon.nixosModules.default
  ];
  
  nixpkgs.config = {
    allowUnsupportedSystem = true;
  };

  nixpkgs.overlays = [
    (final: prev: {
      uboot-asahi = prev.uboot-asahi.overrideAttrs (old: {
        postPatch = (old.postPatch or "") + ''
          for f in scripts/Makefile.lib dts/upstream/Makefile; do
            substituteInPlace "$f" \
              --replace-fail -Eno-node_name_not_empty -Wno-graph_child_address
          done
        '';
      });
    })
  ];

  boot.loader.efi.canTouchEfiVariables = false;

  nix.settings = {
    extra-substituters = [
      "https://nixos-apple-silicon.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
    ];
    builders-use-substitutes = true;
  };

  # Workaround for Mesa 25.3.0 regression
  # https://github.com/nix-community/nixos-apple-silicon/issues/380
  #hardware.graphics.package = assert pkgs.mesa.version == "25.3.0"; (import (fetchTarball {
  #  url = "https://github.com/NixOS/nixpkgs/archive/c5ae371f1a6a7fd27823bc500d9390b38c05fa55.tar.gz";
  #  sha256 = "sha256-4PqRErxfe+2toFJFgcRKZ0UI9NSIOJa+7RXVtBhy4KE=";
  #}) { localSystem = pkgs.stdenv.hostPlatform; }).mesa;
}
