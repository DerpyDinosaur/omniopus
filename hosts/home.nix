{ config, lib, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "nixos";
    homeDirectory = "/home/nixos";

    enableNixpkgsReleaseCheck = false;
    stateVersion = "23.11";
  };
}