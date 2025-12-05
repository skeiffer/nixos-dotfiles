{
  config,
  pkgs,
  ...
}:

let
  apps = import ./applications.nix { inherit pkgs; };

in
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
      playerctl = "${pkgs.playerctl}/bin/playerctl";
      set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
      set-brightness = spawn "brightnessctl" "-e4" "-n2" "set";
      media-play-pause = spawn playerctl [ "play-pause" ];
      media-next = spawn playerctl [ "next" ];
      media-previous = spawn playerctl [ "previous" ];
    in
    {

      # Quickshell Keybinds Start
      "super+Control+Return".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      "super+Space".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      # Quickshell Keybinds End

      XF86AudioRaiseVolume.action = set-volume "5%+";
      XF86AudioLowerVolume.action = set-volume "5%-";
      XF86AudioMute.action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
      XF86AudioMicMute.action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      XF86AudioPlay.action = media-play-pause;
      XF86AudioPrev.action = media-previous;
      XF86AudioNext.action = media-next;
 
      XF86MonBrightnessUp.action = set-brightness "5%+";
      XF86MonBrightnessDown.action = set-brightness "5%-";

      "super+Shift+Slash".action.show-hotkey-overlay = {};
      "super+q".action = close-window;
      "super+b".action = spawn apps.browser;
      "super+Return".action = spawn apps.terminal;
      "super+E".action = spawn apps.fileManager;

      # Tested with ghostty and kitty
      # "super+m".action = spawn apps.terminal [
      #   "--title=spotify_player"
      #   "-e"
      #   "spotify_player"
      # ];

      # 1Passord quick access
      #"super+p".action = spawn [ "${pkgs._1password-gui}/bin/1password" "--quick-access" ];

      "super+t".action = toggle-window-floating;
      "super+l".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "lockScreen"
        "lock"
      ];

      "control+shift+1".action.screenshot = [ ];
      "control+shift+2".action.screenshot-window = [ ];

      "super+Left".action = focus-column-left;
      "super+Right".action = focus-column-right;
      "super+Down".action = focus-workspace-down;
      "super+Up".action = focus-workspace-up;

      "super+Shift+Left".action = move-column-left;
      "super+Shift+Right".action = move-column-right;
      "super+Shift+Down".action = move-column-to-workspace-down;
      "super+Shift+Up".action = move-column-to-workspace-up;
      

      "super+1".action = focus-workspace 1;
      "super+2".action = focus-workspace 2;
      "super+3".action = focus-workspace 3;
      "super+4".action = focus-workspace 4;
      "super+5".action = focus-workspace 5;
      "super+6".action = focus-workspace 6;
      "super+7".action = focus-workspace 7;
      "super+8".action = focus-workspace 8;
      "super+9".action = focus-workspace 9;

      # "super+Ctrl+1".action = move-column-to-workspace 1;
      # "super+Ctrl+2".action = move-column-to-workspace 2;
      # "super+Ctrl+3".action = move-column-to-workspace 3;
      # "super+Ctrl+4".action = move-column-to-workspace 4;
      # "super+Ctrl+5".action = move-column-to-workspace 5;
      # "super+Ctrl+6".action = move-column-to-workspace 6;
      # "super+Ctrl+7".action = move-column-to-workspace 7;
      # "super+Ctrl+8".action = move-column-to-workspace 8;
      # "super+Ctrl+9".action = move-column-to-workspace 9;

      # There are also commands that consume or expel a single window to the side.
      # Mod+BracketLeft  { consume-or-expel-window-left; }
      # Mod+BracketRight { consume-or-expel-window-right; }

      "super+R".action.switch-preset-column-width = {};
      "super+Shift+R".action.reset-window-height = {};
      "super+F".action.maximize-column = {};
      "super+Shift+F".action.fullscreen-window = {};
      "super+C".action.center-column = {};

      # Finer width adjustments.
      # This command can also:
      # * set width in pixels: "1000"
      # * adjust width in pixels: "-5" or "+5"
      # * set width as a percentage of screen width: "25%"
      # * adjust width as a percentage of screen width: "-10%" or "+10%"
      # Pixel sizes use logical, or scaled, pixels. I.e. on an output with scale 2.0,
      # set-column-width "100" will make the column occupy 200 physical screen pixels.
      "super+Minus".action.set-column-width = "-10%";
      "super+Equal".action.set-column-width = "+10%";

      # Finer height adjustments when in column with other windows.
      "super+Shift+Minus".action.set-window-height = "-10%";
      "super+Shift+Equal".action.set-window-height = "+10%";

    };
}