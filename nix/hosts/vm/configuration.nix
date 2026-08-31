{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking = {
    hostName = "nixos-vm";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Asia/Baku";

  i18n.defaultLocale = "en_US.UTF-8";

  virtualisation.vmware.guest.enable = true;

  services = {
    displayManager.ly.enable = true;
    openssh.enable = true;
    xserver = {
      videoDrivers = [ "vmware" ];
    };
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };


  users.users.nullshii = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      tree
    ];
    shell = pkgs.zsh;
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
    zsh.enable = true;
    hyprland.enable = true;
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

  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    btop
    alacritty
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LIBGL_ALWAYS_SOFTWARE = "1";
    GALLIUM_DRIVER = "llvmpipe";
  };

  system.stateVersion = "26.05";
}
