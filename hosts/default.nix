{ nixpkgs, home-manager, nixos-wsl, username, ... }:

{
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