{ config, lib, ... } : {
	stowFiles = attrs :
		lib.mapAttrs ( base : pathslist : 
        map ( path : builtins.trace path {
          path.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/home-manager/dotfiles" + base + path;
        }
				) pathslist ) attrs;
}
