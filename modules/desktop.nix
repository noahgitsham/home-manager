{ pkgs, ... } :
{
  home.packages = let
    wayland-desktop-pkgs = with pkgs; [
      ags
      swaybg
      libnotify
      swaynotificationcenter
      bemenu
      bemoji
      wtype
      j4-dmenu-desktop
      wl-clipboard
      cliphist
      hyprpicker
      grim
      slurp
    ];
    desktop-programs = with pkgs; [
      librewolf
      zathura
      (mpv-unwrapped.override { sixelSupport=true; })
      imv
      gnome-decoder
      cheese
      mepo 
      stremio
      signal-desktop-beta 
      libreoffice
      ungoogled-chromium 
    ];
    utils = with pkgs; [

    ];
  in []
  ++ wayland-desktop-pkgs
  ++ desktop-programs;

  xdg.configFile."hypr/hyprland.conf".enable = false;
  xdg.configFile."hypr/hypridle.conf".enable = false;
  xdg.configFile."emacs/init.el".enable = false;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = false;
  };
  # services.hypridle.enable = true;
  programs.hyprlock.enable = true;
}
