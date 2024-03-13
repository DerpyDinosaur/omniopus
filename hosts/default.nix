{ lib, inputs, nixpkgs, home-manager, nixos-wsl, ... }:

{
  work = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./work
      ./configuration.nix
      nixos-wsl.nixosModules.wsl
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.nixos.imports = [(import ./home.nix)];# ++ [(import ./work/home.nix)];
      }
    ];
  };
}