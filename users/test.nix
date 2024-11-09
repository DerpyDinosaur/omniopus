{ pkgs, stateVersion, system }:

{
  home = {
    inherit stateVersion;
    
    username = "adam";
    homeDirectory = "/home/adam";
    packages = with pkgs;
    [
      git
    ];
  };

  nixpkgs = {
    config = {
      inherit system;
      allowUnfree = true;
      allowUnsupportedSystem = true;
      experimental-features = "nix-command flakes";
    };
  };

  programs.home-manager.enable = true;
}