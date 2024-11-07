{
  description = "Omni Opus";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixos-wsl, ... } @ inputs:
  {
    # NixOS - HOSTNAME
    nixosConfigurations = (
      import ./machines { inherit nixpkgs nixos-wsl; }
    );

    # Home Manager - USERNAME
    # homeConfigurations = {
    #   albalamia = home-manager.lib.homeManagerConfiguration {
    #     inherit nixpkgs;
    #     modules = [
    #       ./users/adam.nix
    #     ];
    #   };
    # };
  };
}