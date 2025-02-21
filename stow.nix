{ lib, config, ... } :
basepath : pathsSets : 
builtins.listToAttrs (concatMap ( path : {
  name = path;
  value = lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles/nvim/.config/nvim";
} ) pathsSets )
