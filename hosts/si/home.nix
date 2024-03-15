{ pkgs, ... }:

{
  home = {
    username = "si";
    homeDirectory = "/home/si";
    stateVersion = "23.11";
    packages = with pkgs;
    [
      # ...
    ];
  };

  # Git
  programs.git = {
    enable = true;
    userName = "albalamia";
    userEmail = "adam.brickhill@seamlessintelligence.com.au";
  };

  # Bash
  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}