{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        widgets = {
          left = [
            { id = "Launcher"; }
            { id = "Clock"; }
            { id = "SystemMonitor"; }
            { id = "ActiveWindow"; }
            { id = "MediaMini"; }
          ];
          center = [
            { id = "Workspace"; }
          ];
          right = [
            { id = "Tray"; }
            { id = "NotificationHistory"; }
            { id = "Battery"; }
            { id = "Network"; }
            { id = "Volume"; }
            { id = "Brightness"; }
            { id = "ControlCenter"; }
          ];
        };
      };

      general = {
        avatarImage = "/home/scott/.face";
      };

      ui = {
        fontDefault = "Sans Serif";
        fontFixed = "monospace";
      };

      location = {
        name = "Kirkland";
        useFahrenheit = true;
        autoLocate = false;
      };

      wallpaper = {
        enable = true;
        directory = "/home/scott/Pictures/Wallpapers";
        viewMode = "recursive";
        automationEnabled = true;
      };

      sessionMenu = {
        powerOptions = [
          { action = "lock";            command = ""; countdownEnabled = true;  enabled = true;  keybind = "1"; }
          { action = "suspend";         command = ""; countdownEnabled = true;  enabled = true;  keybind = "2"; }
          { action = "hibernate";       command = ""; countdownEnabled = true;  enabled = true;  keybind = "3"; }
          { action = "reboot";          command = ""; countdownEnabled = true;  enabled = true;  keybind = "4"; }
          { action = "logout";          command = ""; countdownEnabled = true;  enabled = true;  keybind = "5"; }
          { action = "shutdown";        command = ""; countdownEnabled = true;  enabled = true;  keybind = "6"; }
          { action = "rebootToUefi";    command = ""; countdownEnabled = true;  enabled = true;  keybind = "7"; }
          { action = "userspaceReboot"; command = ""; countdownEnabled = true;  enabled = false; keybind = "";  }
        ];
      };

      colorSchemes = {
        predefinedScheme = "Tokyo Night";
        generationMethod = "faithful";
      };

      templates = {
        activeTemplates = [
          { enabled = true; id = "gtk"; }
        ];
      };

      idle = {
        enabled = true;
      };
    };
  };
}