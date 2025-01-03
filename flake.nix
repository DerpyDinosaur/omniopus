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
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs = inputs@{ nixpkgs, nixos-wsl, home-manager, ghostty, ... }:
  let
    username = "adam";
  in
  {
    nixosConfigurations = (
      import ./hosts {
        # Functional
        inherit nixpkgs home-manager nixos-wsl ghostty;
        # Non-Functional
        inherit username;
      }
    );
  };
}

