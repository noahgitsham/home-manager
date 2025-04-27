{ config, pkgs, ... }:
let
  cursor-config = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
  };
in {
  home.pointerCursor = cursor-config;
  gtk.cursorTheme = cursor-config;

  gtk.theme = {
    package = pkgs.fluent-gtk-theme;
    name = "Fluent";
  };
}
