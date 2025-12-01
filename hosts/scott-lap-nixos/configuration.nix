{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/laptop.nix
    ./mlfw-deps.nix
  ];
  #hardware.asahi.extractPeripheralFirmware = false;
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  #hardware.graphics.package = inputs.nixpkgs-mesa.legacyPackages.aarch64-linux.mesa;

  networking.hostName = "scott-lap-nixos"; # Define your hostname.
  networking.networkmanager.wifi.backend = "iwd";
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General.EnableNetworkConfiguration = true;
      Settings.AutoConnect = true;
    };
  };
}