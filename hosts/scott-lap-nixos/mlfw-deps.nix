{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    # General
    wget
    curl
    unzip
    gum
    rsync
    git
    figlet
    xdg-utils
    xdg-user-dirs
    libnotify
    vim
    python313
    python313Packages.screeninfo
    python313Packages.pygobject3
    python313Packages.pycairo
    flatpak
    jq
    xclip
    neovim
    fzf
    pavucontrol
    pipx
    ninja
    meson
    gcc
    pkg-config
    cairo
    # waypaper
      
    # Hyprland
    hyprland
    hyprpaper
    hyprlock
    hypridle
    hyprland-qt-support
    hyprpicker
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Terminal
    kitty

    # Tools
    kdePackages.qtwayland
    fastfetch
    matugen
    eza
    brightnessctl
    networkmanagerapplet
    imagemagick
    htop
    blueman
    grim
    slurp
    cliphist
    nwg-look
    libsForQt5.qt5ct
    kdePackages.qt6ct
    waybar
    rofi
    polkit_gnome
    zsh
    zsh-completions
    python3Packages.screeninfo
    pavucontrol
    papirus-icon-theme
    swaynotificationcenter
    gvfs
    wlogout
    # waypaper
    grimblast
    bibata-cursors
    nwg-dock-hyprland
    power-profiles-daemon
    pywalfox-native
    vlc
    nautilus
  ];


  # This enables fontconfig and installs your fonts system-wide
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      font-awesome
      fira-sans
      fira-code
      fira-code-symbols
    ];
  };

  #programs.oh-my-posh.enable = true;

}