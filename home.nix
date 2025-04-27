{ config, pkgs, lib, ... }:
{
  home.username = "noah";
  home.homeDirectory = "/home/noah";

  programs.home-manager.enable = true;

  imports = [
    ./modules/music.nix
    ./modules/neovim.nix
    ./modules/cli.nix
    ./modules/mime.nix
    ./modules/uni.nix
    ./modules/theme.nix
  ];
  home.packages = with pkgs; [ zoom-us ];

  nixpkgs.config.allowUnfree = true;

  # home.file = let
  #   stow = import ./stow.nix { config = config; lib = pkgs.lib; };
  # in stow.stowFiles "${config.home.homeDirectory}/.config/home-manager/dotfiles/" {
  #   "bspwm" = [ ".config/bspwm/bspwmrc" ];
  # };

  home.file = let
    # TODO: Stupid hack for an even stupider issue
    # https://github.com/nix-community/home-manager/issues/3032
    dotfiles-dir = "${config.home.homeDirectory}/.config/home-manager/dotfiles"; 
    dotfile = path: config.lib.file.mkOutOfStoreSymlink "${dotfiles-dir}/${path}";
  in {
    ".config/zsh/.zshrc".source  = dotfile "zsh/.zshrc";
    ".config/zsh/.zshenv".source = dotfile "zsh/.zshenv";
    ".config/nvim".source  = dotfile "nvim/.config/nvim";
    ".config/foot".source  = dotfile "foot/.config/foot";
    ".config/ags".source   = dotfile "ags/.config/ags";
    ".config/emacs".source = dotfile "emacs/.config/emacs";
    ".config/hypr".source  = dotfile "hypr/.config/hypr";

    ".config/tmux".source = dotfile "tmux/.config/tmux";
    ".local/share/tmux/plugins/tpm".source = fetchGit { url = "https://github.com/tmux-plugins/tpm"; rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946"; };

    ".config/bspwm".source = dotfile "bspwm/.config/bspwm";
    ".config/sxhkd".source = dotfile "sxhkd/.config/sxhkd";

    ".config/user-dirs.dirs".source   = ./dotfiles/user-dirs/.config/user-dirs.dirs;
    ".config/user-dirs.locale".source = ./dotfiles/user-dirs/.config/user-dirs.locale;
  };

  home.activation.diff = lib.hm.dag.entryAfter ["installPackages"] ''
  echo
  ${pkgs.nvd}/bin/nvd diff $oldGenPath $newGenPath
  echo
  '';

  home.stateVersion = "24.05";
}
