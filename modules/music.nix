{ pkgs, ... } : {
	home.packages = with pkgs; [
		songrec
		spotify
	];
}
