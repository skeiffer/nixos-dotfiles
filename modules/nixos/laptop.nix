{ lib, ... }:
{
  # Lid & PowerKey settings
  #
  # Suspend: Store system state to RAM - fast, requires minimal power to maintain RAM.
  # Hibernate: Store system state & RAM to Disk, and then poweroff the system.
  #
  # NOTE: Hibernate is not supported by Asahi Linux.
  services.logind.settings.Login = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
    # 'Docked' means: more than one display is connected or the system is inserted in a docking station
    lidSwitchDocked = "ignore";

    powerKey = "suspend";
    powerKeyLongPress = "poweroff";
  };
  systemd.targets.sleep.enable = true;
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernate=no
    AllowSuspendThenHibernate=no
    HibernateDelaySec=5min
  '';
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}