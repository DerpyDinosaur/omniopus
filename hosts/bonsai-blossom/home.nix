{ pkgs, username, ... }:

{
  # Configs
  ## Sway
  home.file.".config/sway/config".source = ../../programs/sway/config;

  ## Wallpaper
  # home.file."wallpapers" = {
  #   source = "../../wallpapers";
  # };
  home.file."wallpapers".source = ../../wallpapers;

  home.stateVersion = "23.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}