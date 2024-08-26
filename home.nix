{ config, pkgs, lib, ... }:

let
  cursor-name = "Adwaita";
  cursor-package = pkgs.adwaita-icon-theme;
in {
  home.username = "noah";
  home.homeDirectory = "/home/noah";

  programs.home-manager.enable = true;

  home.activation.diff = lib.hm.dag.entryAfter ["installPackages"] ''
  echo
  ${pkgs.nvd}/bin/nvd diff $oldGenPath $newGenPath
  echo
  '';

  imports = [
    ./modules/music.nix
    ./modules/neovim.nix
    ./modules/cli.nix
    ./modules/desktop.nix
    # ./modules/games.nix
  ];
  home.packages = with pkgs; [ blender stremio ];

  nixpkgs.config.allowUnfree = true;

  services.emacs = {
    enable = true;
    client.enable = true;
  };
  programs.emacs = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
    automount = true;
  };

  home.file = let
    stow = import ./stow.nix { config = config; lib = pkgs.lib; };
  in
  {
    ".zshrc".source = ./dotfiles/zsh/.zshrc;
    ".zshenv".source = ./dotfiles/zsh/.zshenv;
    ".config/nvim".source = ./dotfiles/nvim/.config/nvim;
    ".config/foot".source = ./dotfiles/foot/.config/foot;
    ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/tmux/.config/tmux";
    ".local/share/tmux/plugins/tpm".source = fetchGit { url = "https://github.com/tmux-plugins/tpm"; rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946"; };
    ".config/ags".source = ./dotfiles/ags/.config/ags;
    ".config/emacs".source = config.lib.file.mkOutOfStoreSymlink "/home/noah/.config/home-manager/dotfiles/emacs/.config/emacs";
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/home/noah/.config/home-manager/dotfiles/hypr/.config/hypr";

    ".config/user-dirs.dirs".source   = ./dotfiles/user-dirs/.config/user-dirs.dirs;
    ".config/user-dirs.locale".source = ./dotfiles/user-dirs/.config/user-dirs.locale;
  }# // stow.stowFiles { "tmux" = [ ".config/tmux" ]; }
  ;

  xdg.configFile."hypr/hyprland.conf".enable = false;

  home.pointerCursor = {
    name = cursor-name;
    package = cursor-package;
  };

  gtk.cursorTheme = {
    name = cursor-name;
    package = cursor-package;
  };

  home.stateVersion = "24.05";
}
