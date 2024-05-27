{ pkgs, username, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod1"; # Alt Key
      terminal = "kitty";
      gaps.smartGaps = true;
      bars.position = "top";
      # output = {
      #   "Virtual-1" = {
      #     mode = "1920x1080@120Hz";
      #   };
      #   "Virtual-2" = {
      #     mode = "1920x1080@120Hz";
      #   };
      # };
    };
  };

  # Wallpaper
  home.file.".wallpapers/spiderverse.jpg".source = ../../wallpapers/spiderverse.jpg;

  home.stateVersion = "23.11";
}