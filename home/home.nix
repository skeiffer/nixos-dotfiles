{ config, pkgs, system, inputs, ... }:

{
  imports = [
    ./wallpapers.nix
    ./noctalia.nix
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
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
    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
    };
    default.settings = {
      theme = "dark";
      dynamicTheming = true;
      # Add any other settings here
    };
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableClipboard = true;            # Clipboard history manager
    enableVPN = true;                  # VPN management widget
    enableBrightnessControl = true;    # Backlight/brightness controls
    enableColorPicker = true;          # Color picker tool
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableSystemSound = true;          # System sound effects
  };
}
