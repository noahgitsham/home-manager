{ pkgs, ... } : {
  home.packages = with pkgs; [
    playerctl
    pamixer

    songrec
    spotify
    ncspot
    blanket

    nicotine-plus
  ];

  xdg.desktopEntries.soundcloud = {
    name = "Soundcloud";
    exec = "${pkgs.librewolf}/bin/librewolf --new-window https://soundcloud.com/discover";
    terminal = false;
    type = "Application";
  };
}
