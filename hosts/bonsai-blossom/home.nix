{ pkgs, username, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Configs
  ## Sway
  home.file.".config/sway/config".source = ../../programs/sway/config;

  ## Wallpaper
  home.file.".wallpapers/abstract-wave.jpg".source = ../../wallpapers/abstract-wave.jpg;
  home.file.".wallpapers/spiderverse.jpg".source   = ../../wallpapers/spiderverse.jpg;

  home.stateVersion = "23.11";
}