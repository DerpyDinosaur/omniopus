{ nixpkgs, home-manager, nixos-wsl inputs, ... }: {

  albalamia = home-manager.lib.homeManagerConfiguration {
    specialArgs = { inherit inputs; };
    modules = [
      ./adam.nix
    ];
  };
}