{ pkgs, ... } : {
  xdg.desktopEntries.soundcloud = {
    name = "Soundcloud";
    exec = "${pkgs.librewolf}/bin/librewolf --new-window https://soundcloud.com/discover";
    terminal = false;
    type = "Application";
  };
}
