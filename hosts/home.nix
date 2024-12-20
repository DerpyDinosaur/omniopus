{ pkgs, username, ... }:

{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
    packages = with pkgs;
    [
      # ..
    ];
  };

  # Git
  programs.git = {
    enable = true;
    userName = "DerpyDinosaur";
    userEmail = "adam.brickhill@lonetree.xyz";
    extraConfig = {
      credential.helper = "store";
    };
  };

  # ZSH
  # Oh-My-ZSH Themes
  # imajes
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "albalamia";
      custom = "/home/${username}/.oh-my-zsh";
    };

    history.size = 1000;
  };
  home.file.".oh-my-zsh/themes/albalamia.zsh-theme".source = ../programs/zsh/albalamia.zsh-theme;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}