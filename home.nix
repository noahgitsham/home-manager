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

  home.file = let
    dotfiles-dir = "${config.home.homeDirectory}/.config/home-manager/dotfiles";
  in {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/zsh/.zshrc";
    ".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/zsh/.zshenv";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/nvim/.config/nvim";
    ".config/foot".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/foot/.config/foot";
    ".config/ags".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/ags/.config/ags";
    ".config/emacs".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/emacs/.config/emacs";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/hypr/.config/hypr";

    ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/tmux/.config/tmux";
    ".local/share/tmux/plugins/tpm".source = fetchGit { url = "https://github.com/tmux-plugins/tpm"; rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946"; };

    ".config/bspwm".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/bspwm/.config/bspwm";
    ".config/sxhkd".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/sxhkd/.config/sxhkd";

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
