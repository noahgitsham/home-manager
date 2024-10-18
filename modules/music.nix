{ pkgs, ... } : {
  home.packages = with pkgs; [
    playerctl
    pamixer

    songrec
    spotify
    blanket
  ];
}
