{ config, pkgs, ... }:

{
  home = {
    username = "adam";
    homeDirectory = "/home/adam";
    stateVersion = "25.05";
    packages = with pkgs;
    [
      i3
      firefox-esr
      neovim
      sublime4
      git
      gh
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
  };

  # Git
  programs.git = {
    enable = true;
    userName = "albalamia";
    userEmail = "adam.brickhill@seamlessintelligence.com.au";
    extraConfig = {
      credential.helper = "store";
    };
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

  home.file = {
    # Display Manager Config
    ".xinitrc".text = ''exec i3'';
    # ZSH Theme
    ".oh-my-zsh/themes/si.zsh-theme".source = ../programs/zsh/si.zsh-theme;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}