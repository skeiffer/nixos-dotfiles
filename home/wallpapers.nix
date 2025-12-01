{ config, pkgs, lib, ... }:
let 
  wallpapersRepo = builtins.fetchGit {
    url = "https://github.com/mylinuxforwork/wallpaper";
    rev = "4ef930c2dadb0d978cbb73fe837a87a32d76dd8a";
  };
in 
{
  home.file."Pictures/wallpapers/mlfw" = {
    source = wallpapersRepo;
  };
}
