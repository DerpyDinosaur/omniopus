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
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs@{ nixpkgs, nixos-wsl, home-manager, nvf, ... }:
  let
    username = "adam";
  in
  {
    nixosConfigurations = (
      import ./hosts {
        # Functional
        inherit nixpkgs home-manager nixos-wsl nvf;
        # Non-Functional
        inherit username;
      }
    );
  };
}
