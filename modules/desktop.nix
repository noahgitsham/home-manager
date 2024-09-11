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
    j4-dmenu-desktop
    wl-clipboard
    cliphist
    hyprpicker
    grim
    slurp
  ];
  utils = with pkgs; [
    zathura
    (mpv-unwrapped.override { sixelSupport=true; })
    imv
    gnome-decoder
    cheese
    mepo 
  ];
  in
  with pkgs; [ librewolf libreoffice ]
  ++ wayland-desktop-pkgs
  ++ utils;

  xdg.configFile."hypr/hyprland.conf".enable = false;
  xdg.configFile."hypr/hypridle.conf".enable = false;
  xdg.configFile."emacs/init.el".enable = false;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # services.hypridle.enable = true;
  programs.hyprlock.enable = true;
}
