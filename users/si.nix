{ config, pkgs, ... }:

{
  home.username = "si";
  home.homeDirectory = "/home/si";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "albalamia";
    userEmail = "adam.brickhill@seamlessintelligence.com.au";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}