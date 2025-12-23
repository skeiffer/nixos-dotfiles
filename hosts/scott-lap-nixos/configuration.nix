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
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire.adjust-sample-rate = {
        "context.properties" = {
          "default.clock.min-quantum" = 1024; # Fix for crackling audio.
        };
      };
  };
}