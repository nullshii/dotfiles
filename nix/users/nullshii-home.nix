{ config, pkgs, ... }:

let
  username = "nullshii";
  homeDir = "/home/${username}";
  outOfStoreSymLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = homeDir;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  xdg.configFile = {
    "hypr" = { 
      source = outOfStoreSymLink "${homeDir}/dotfiles/hypr";
      recursive = true;
    };
    "quickshell" = { 
      source = outOfStoreSymLink "${homeDir}/dotfiles/quickshell";
      recursive = true;
    };
    "nvim" = { 
      source = outOfStoreSymLink "${homeDir}/dotfiles/nvim";
      recursive = true;
    };
    "alacritty" = { 
      source = outOfStoreSymLink "${homeDir}/dotfiles/alacritty";
      recursive = true;
    };
    "kitty" = { 
      source = outOfStoreSymLink "${homeDir}/dotfiles/kitty";
      recursive = true;
    };
    "fish" = { 
      source = outOfStoreSymLink "${homeDir}/dotfiles/fish";
      recursive = true;
    };
  };

  home.file = {
    ".zshrc".source = outOfStoreSymLink "${homeDir}/dotfiles/.zshrc";
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
