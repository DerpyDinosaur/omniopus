# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ pkgs, nixos-wsl, home-manager, ... }:

{
  # Define user accounts
  users.users.si = {
    description = "Work Account";

    group = "users";
    extraGroups = [ "wheel" "docker" ];
    isNormalUser = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.si = import ./home.nix;
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [];

  # WSL
  wsl.enable = true;
  wsl.defaultUser = "si";
  wsl.docker-desktop.enable = true;
}