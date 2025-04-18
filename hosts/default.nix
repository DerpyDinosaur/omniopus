# Hosts will be defined with the following standard

# PCs - Generic tree names
# Laptop - Bonsai tree species prefixed with 'bonsai-'
# Servers - Fruit trees species since they bare services (fruit)

{ nixpkgs, home-manager, nixos-wsl, username, ghostty, nvf, ... }:

{
  bonsai-blossom = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit username; };
    modules = [
      ./bonsai-blossom
      ./configuration.nix
      ../programs/greetd
      home-manager.nixosModules.home-manager
      {
        environment.systemPackages = [
          ghostty.packages.x86_64-linux.default
        ];
      }
      nvf.nixosModules.default
    ];
  };

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

  # walnut = nixpkgs.lib.nixosSystem {
  #   system = "x86_64-linux";
  #   specialArgs = { inherit username; };
  #   modules = [
  #     ./walnut
  #     home-manager.nixosModules.home-manager
  #   ];
  # };

  maple = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit username; };
    modules = [
      ./maple
      ./configuration.nix
      ../programs/greetd
      home-manager.nixosModules.home-manager
    ];
  };
}