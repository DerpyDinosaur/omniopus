{ pkgs, username, ... }:

{
  # Configs
  ## Sway
  home.file.".config/sway/config".source = ../../programs/sway/config;
  ## ZSH
  programs.zsh = {
    enable = true;

    shellAliases = {
      battery = "cat /sys/class/power_supply/BAT0/capacity";
    };
  };
  ## Foot
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        dpi-aware = "yes";
        font = "monospace:size=14";
        font-size-adjustment = 2;
      };
      colors = {
        alpha=0.8;
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
  # Rofi
  programs.rofi = {
    enable = true;
    theme = "/home/${username}/.config/rofi/square-evergreen.rasi";
  };
  home.file.".config/rofi".source = ../../programs/rofi;

  # Wallpapers
  home.file."pictures/wallpapers".source = ../../wallpapers;

  home.stateVersion = "23.11";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}