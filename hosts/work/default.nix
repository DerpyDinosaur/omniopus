# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ pkgs, lib, nixos-wsl, ... }:

{
  # Define user accounts
  users.users = {
    si = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };

    nixos = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  # WSL
  wsl.enable = true;
  wsl.defaultUser = "nixos";
  # wsl.docker-desktop.enable = true;
}