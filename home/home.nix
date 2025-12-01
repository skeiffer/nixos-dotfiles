{ config, pkgs, system, inputs, ... }:

{
  imports = [
    ./wallpapers.nix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    #inputs.caelestia-shell.homeManagerModules.default
  ];
  home.username = "scott";
  home.homeDirectory = "/home/scott";
  home.stateVersion = "25.11";

  programs.git.enable = true;
  programs.bash = {
    enable = true;
    #profileExtra = ''
    #  if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    #    exec hyprland
    #  fi
    #'';
  };
  programs.dankMaterialShell = {
    enable = true;
    default.settings = {
      theme = "dark";
      dynamicTheming = true;
      # Add any other settings here
    };
  };
  # programs.caelestia = {
  #   enable = true;
    
  #   systemd = {
  #     enable = false;
  #     # target = "graphical-session.target";
  #     # environment = [];
  #   };

  #   cli = {
  #     enable = true; 
  #     settings = {
  #       theme.enableGtk = false;
  #     };
  #   };

  #   settings = {
  #     general.idle = {
  #       timeouts = [
  #         {
  #           timeout = 1800;
  #           idleAction = "lock";
  #         }
  #       ];
  #     };
  #     bar.status = {
  #       showBattery = false;
  #     };
  #     paths.wallpaperDir = "~/Pictures/wallpapers"; 
      
  #     background.visualiser.enabled = true;
  #     general.apps.terminal = [ "foot" ];
  #   };
  # };

}
