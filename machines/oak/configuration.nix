# Oak - Main PC
# General Use, Gaming, Work

{ pkgs, nixos-wsl, home-manager, ... }:

{
  networking.hostName = "oak";

  # Define user accounts
  users = {
    users.albalamia = {
      description = "Personal Account";

      group = "users";
      extraGroups = [ "wheel" "docker" ];
      isNormalUser = true;
      useDefaultShell = true;
    };
    defaultUserShell = pkgs.zsh;
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [];

  # WSL
  wsl.enable = true;
  wsl.defaultUser = "albalamia";
}