{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  nixpkgs.config.allowUnfree = true;
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking = {
    hostName = "nixos-acer-laptop";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Baku";

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    displayManager.ly.enable = true;
    upower.enable = true;
    openssh.enable = true;
    xserver = {
      # videoDrivers = [ "nvidia" ];
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true; # Required for Wayland frame capture
      openFirewall = true; # Opens port 47989, 47990, 48010, etc.
    };
  };

  users.users.nullshii = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      nullshii = import ../../users/nullshii-home.nix;
    };
  };


  programs = {
    firefox.enable = true;
    uwsm.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
    fish = {
      enable = true;
    };
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    git = {
      enable = true;
      config = {
        user.email = "nullshii@domain.name";
        user.name = "nullshii";
        init.defaultBranch = "main";
	pull.rebase = false;
      };
    };
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    vim
    neovim
    wget
    btop
    alacritty
    kitty
    hyprpaper
    gitui
    fastfetch
    matugen
    cmatrix
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = true; # Set to true if using turing or newer GPUs with open kernel modules
    nvidiaSettings = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  system.stateVersion = "26.05";
}
