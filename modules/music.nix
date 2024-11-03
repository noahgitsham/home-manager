{ pkgs, ... } : {
  home.packages = with pkgs; [
    playerctl
    pamixer

    songrec
    spotify
    ncspot
    blanket
  ];
}
