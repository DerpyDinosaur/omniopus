{ pkgs, username, ... }:

{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    packages = with pkgs;
    [
      # ...
    ];
  };

  # Git
  programs.git = {
    enable = true;
    userName = "DerpyDinosaur";
    userEmail = "adam.brickhill@lonetree.xyz";
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