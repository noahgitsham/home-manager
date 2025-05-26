{ config, pkgs, ... }:
let
  cursor-config = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
  };
in {
  home.pointerCursor = cursor-config;

  gtk = {
    enable = true;
    cursorTheme = cursor-config;
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita";
      package = pkgs.adwaita-qt;
    };
  };
}
