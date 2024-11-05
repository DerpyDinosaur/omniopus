{ nixpkgs, home-manager, nixos-wsl inputs, ... }: {

  albalamia = home-manager.lib.homeManagerConfiguration {
    specialArgs = { inherit inputs; };
    modules = [
      ./oak
      ./configuration.nix
      nixos-wsl.nixosModules.wsl
      home-manager.nixosModules.home-manager
    ];
  };
}