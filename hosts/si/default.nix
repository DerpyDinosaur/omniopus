# SI - Work PC
# Work

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
    users.si = import ../../users/si.nix;
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [];

  # WSL
  wsl.enable = true;
  wsl.defaultUser = "si";
  # wsl.docker-desktop.enable = true;
}