{ nixpkgs, home-manager, inputs, ... }: {

  albalamia = home-manager.lib.homeManagerConfiguration {
    specialArgs = { inherit inputs; };
    modules = [
      ./adam.nix
    ];
  };
}