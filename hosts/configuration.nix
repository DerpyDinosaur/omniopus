{ pkgs, username, ... }:

{
  users = {
    users.${username} = {
      description = "Personal Account";

      group = "users";
      extraGroups = [ "wheel" "docker" ];
      isNormalUser = true;
      useDefaultShell = true;
    };
    defaultUserShell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit username; };
    users.${username} = import ./home.nix;
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [
    # Shell
    zsh
    # Github
    git
    # Tools
    neovim
    trash-cli
    bun
    unzip
  ];
  
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    zsh = {
      enable = true;
    };
  };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11";
}
