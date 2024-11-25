{ pkgs, ... } :
{
  home.packages = let

    hyprland-desktop-pkgs = with pkgs; [
      ags
      bemenu
      bemoji
      cliphist
      grim
      hypridle
      hyprlock
      hyprpicker
      hyprpolkitagent
      j4-dmenu-desktop
      libnotify
      lxqt.lxqt-policykit
      slurp
      swaybg
      swaynotificationcenter
      wl-clipboard
      wlsunset
      wtype
    ];

    desktop-programs = with pkgs; [
      cheese
      xfce.thunar
      element-desktop
      freetube
      gnome-decoder
      gnome-solanum
      imv
      libreoffice
      librewolf
      webcamoid
      mepo 
      (mpv-unwrapped.override { sixelSupport=true; })
      obs-studio
      qbittorrent
      signal-desktop-beta 
      stremio
      ungoogled-chromium 
      zathura
    ];
    utils = with pkgs; [

    ];
  in []
  ++ hyprland-desktop-pkgs
  ++ desktop-programs;

  # xdg.configFile."hypr/hyprland.conf".enable = false;
  # xdg.configFile."hypr/hypridle.conf".enable = false;
  xdg.configFile."emacs/init.el".enable = false;

  # systemd.user.sessionVariables = {}

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   xwayland.enable = true;
  #   systemd.enable = false;
  # };
}
