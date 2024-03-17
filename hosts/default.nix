# Hosts will be defined with the following standard

# PCs - Generic tree names
# Laptop - Bonsai tree species prefixed with 'bonsai-'
# Servers - Fruit trees species since they bare services (fruit)

{ nixpkgs, home-manager, nixos-wsl, username, ... }:

{
  # bonsai-azalea = nixpkgs.lib.nixosSystem {
  #   system = "x86_64-linux";
  #   specialArgs = { inherit username; };
  #   modules = [
  #     ./bonsia-azalea
  #     ./configuration.nix
  #     home-manager.nixosModules.home-manager
  #   ];
  # };

  oak = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit username; };
    modules = [
      ./oak
      ./configuration.nix
      nixos-wsl.nixosModules.wsl
      home-manager.nixosModules.home-manager
    ];
  };

  si = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit username; };
    modules = [
      ./si
      ./configuration.nix
      nixos-wsl.nixosModules.wsl
      home-manager.nixosModules.home-manager
    ];
  };
}