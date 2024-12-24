{ config, pkgs, lib, ... }:

let
  cursor-config = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
  };
in {
  home.username = "noah";
  home.homeDirectory = "/home/noah";

  programs.home-manager.enable = true;

  imports = [
    ./modules/music.nix
    ./modules/neovim.nix
    ./modules/emacs.nix
    ./modules/cli.nix
    ./modules/desktop.nix
    ./modules/design.nix
    ./modules/mime.nix
    ./modules/syncthing.nix
    ./modules/production.nix
    ./modules/games.nix
    ./modules/uni.nix
    ./modules/password-management.nix
    ./modules/custom.nix
  ];
  home.packages = with pkgs; [ zoom-us ];

  nixpkgs.config.allowUnfree = true;

  services.udiskie = {
    enable = true;
    automount = true;
  };

  # home.file = let
  #   stow = import ./stow.nix { config = config; lib = pkgs.lib; };
  # in stow.stowFiles "${config.home.homeDirectory}/.config/home-manager/dotfiles/" {
  #   "bspwm" = [ ".config/bspwm/bspwmrc" ];
  # };

  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/zsh/.zshrc";
    ".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/zsh/.zshenv";
    # ".config/nvim".source = ./dotfiles/nvim/.config/nvim;
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/nvim/.config/nvim";
    ".config/foot".source = ./dotfiles/foot/.config/foot;
    ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/tmux/.config/tmux";
    ".local/share/tmux/plugins/tpm".source = fetchGit { url = "https://github.com/tmux-plugins/tpm"; rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946"; };
    ".config/ags".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/ags/.config/ags";
    ".config/emacs".source = config.lib.file.mkOutOfStoreSymlink "/home/noah/.config/home-manager/dotfiles/emacs/.config/emacs";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/noah/.config/home-manager/dotfiles/hypr/.config/hypr";

    ".config/bspwm".source = config.lib.file.mkOutOfStoreSymlink "/home/noah/.config/home-manager/dotfiles/bspwm/.config/bspwm";
    ".config/sxhkd".source = config.lib.file.mkOutOfStoreSymlink "/home/noah/.config/home-manager/dotfiles/sxhkd/.config/sxhkd";

    ".config/user-dirs.dirs".source   = ./dotfiles/user-dirs/.config/user-dirs.dirs;
    ".config/user-dirs.locale".source = ./dotfiles/user-dirs/.config/user-dirs.locale;
  };

  home.pointerCursor = cursor-config;
  gtk.cursorTheme = cursor-config;

  gtk.theme = {
    package = pkgs.fluent-gtk-theme;
    name = "Fluent";
  };

  home.activation.diff = lib.hm.dag.entryAfter ["installPackages"] ''
  echo
  ${pkgs.nvd}/bin/nvd diff $oldGenPath $newGenPath
  echo
  '';

  home.stateVersion = "24.05";
}
