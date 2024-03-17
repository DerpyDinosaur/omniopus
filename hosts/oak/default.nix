# Oak - Main PC
# General Use, Gaming, Work

{ pkgs, nixos-wsl, home-manager, ... }:

{
  networking.hostName = "oak";

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
  wsl.defaultUser = "albalamia";
  # wsl.docker-desktop.enable = true;
}