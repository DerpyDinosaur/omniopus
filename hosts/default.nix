# Hosts will be defined with the following standard

# PCs - Generic tree names
# Laptop - Bonsai tree species prefixed with 'bonsai-'
# Servers - Fruit trees species since they bare services (fruit)

{ nixpkgs, home-manager, ... }: {

  bonsai-blossom = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      ./bonsai-blossom
      ./configuration.nix
      ../programs/greetd
      home-manager.nixosModules.home-manager
    ];
  };

  oak = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      ./oak
      ./configuration.nix
      home-manager.nixosModules.home-manager
    ];
  };

  walnut = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      ./walnut
      home-manager.nixosModules.home-manager
    ];
  };
}