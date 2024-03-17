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
    extraConfig.credential.helper = "store";
  };

  # Bash
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "si";
      custom = "/home/si/.oh-my-zsh";
    };

    history.size = 1000;
  };
  home.file.".oh-my-zsh/themes/si.zsh-theme".source = ../programs/zsh/si.zsh-theme;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}