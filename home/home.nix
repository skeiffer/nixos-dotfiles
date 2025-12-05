{ config, pkgs, system, inputs, ... }:
let 
  cursorPkg = pkgs.catppuccin-cursors.mochaDark;
  cursorName = "catppuccin-mocha-dark-cursors";
  cursorSize = 24;
in
{
  imports = [
    ./wallpapers.nix
    ./niri
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

  home.sessionVariables = {
    "NIXOS_OZONE_WL" = "1"; # for any ozone-based browser & electron apps to run on wayland
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
    # enable native Wayland support for most Electron apps
    "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
    # misc
    "_JAVA_AWT_WM_NONREPARENTING" = "1";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
    "QT_QPA_PLATFORM" = "wayland";
    "SDL_VIDEODRIVER" = "wayland";
    "GDK_BACKEND" = "wayland";
    "XDG_SESSION_TYPE" = "wayland";

    # Cursor vars for xwayland
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = cursorSize;
  };

  home.pointerCursor = {
    package = cursorPkg;
    name = cursorName;
    size = cursorSize;
    x11.enable = true;
    gtk.enable = true;
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
