{ inputs, vars, pkgs, home-manager, ... }:

{
  imports = [
    ../../hosts/${vars.host}/configuration.nix
    ./xdg.nix
    ./greetd.nix
  ];
  
  networking.networkmanager.enable = true;
  networking.hostName = "${vars.host}";

  #nix.settings.use-xdg-base-directories = true;
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  #services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;

  #services.displayManager = {
  #  sddm.enable = true;
  #  sddm.theme = "catppuccin-mocha-mauve";
  #  sddm.wayland.enable = true;
  #};


  programs.seahorse.enable = true;
  programs.firefox.enable = true;
  programs.thunar.enable = true;
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    vim
    neovim
    vscode
    tree
    wget
    git
    kitty
    hyprpaper
    wlr-randr
    pavucontrol
    p7zip
    youtube-music
    playerctl
    brightnessctl
    tuigreet
    base16-schemes # Themeing
  ];
  
  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  users.users.scott = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  system.stateVersion = "25.11";
}
