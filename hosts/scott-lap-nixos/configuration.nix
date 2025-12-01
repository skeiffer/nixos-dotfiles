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
  ];
  hardware.asahi.peripheralFirmwareDirectory = ./firmware;
  #hardware.graphics.package = inputs.nixpkgs-mesa.legacyPackages.aarch64-linux.mesa;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

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