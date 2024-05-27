{ pkgs, username, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod1"; # Alt Key
      terminal = "kitty";
      output = {
        "Virtual-1" = {
          mode = "1920x1080@120Hz";
        };
      };
    };
  };
}