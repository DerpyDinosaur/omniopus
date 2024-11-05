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
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  {
    # NixOS - HOSTNAME
    nixConfigurations = (
      import ./machines { inherit pkgs nixos-wsl; }
    );

    # Home Manager - USERNAME
    homeConfigurations = (
      import ./users { inherit pkgs nixos-wsl; }
    );
  };
}

