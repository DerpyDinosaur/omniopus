# Blossom - Personal Laptop

{ config, pkgs, home-manager, username, ... }:

{
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "bonsai-blossom";
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Perth";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_AU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  services.xserver.xkb.layout = "aus";

  # Window Manager
  hardware.opengl.enable = true;
  programs.hyprland.enable = true;
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      extraPackages = with pkgs; [
        wl-clipboard # Wayland copy & paste support
        swaylock 
        swayidle
        foot # Terminal
        light # Brightness
        rofi
      ];
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
      '';
    };
    light.enable = true;
  };

  # Define user accounts
  users.users.${username}.extraGroups = [ "video" ]; # Volume

  users.users.si = {
    description = "Work Account";

    group = "users";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    isNormalUser = true;
    useDefaultShell = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit username; };
    users.si = import ../../users/si.nix;
    users.${username} = import ./home.nix;
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [
    wlr-randr # Screen Display
    # Browser
    firefox-devedition
    # Software
    sublime4
    gh # Github cli
  ];

  # Allow unfree packages
  nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1w"
      ];
  };

  # Docker
  virtualisation.docker = {
    enable = true;
    # enableOnBoot = true;
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
      source-han-sans
      # Mono
      jetbrains-mono
      # Icons
      font-awesome
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Noto Sans" "Source Han Sans" ];
      monospace = [ "JetBrains Mono" ];
    };
  };
}
