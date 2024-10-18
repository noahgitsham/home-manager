{ pkgs, ... } :
{
  home.packages = let
    hyprland-desktop-pkgs = with pkgs; [
      ags
      swaybg
      libnotify
      swaynotificationcenter
      bemenu
      bemoji
      wtype
      j4-dmenu-desktop
      wl-clipboard
      (cliphist.overrideAttrs (_old: {
        src = pkgs.fetchFromGitHub {
          owner = "sentriz";
          repo = "cliphist";
          rev = "c49dcd26168f704324d90d23b9381f39c30572bd";
          sha256 = "sha256-2mn55DeF8Yxq5jwQAjAcvZAwAg+pZ4BkEitP6S2N0HY=";
        };
        vendorHash = "sha256-M5n7/QWQ5POWE4hSCMa0+GOVhEDCOILYqkSYIGoy/l0=";
      }))
      hyprpicker
      grim
      slurp
      lxqt.lxqt-policykit
      wlsunset
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
      obs-studio
      element-desktop
      freetube
    ];
    utils = with pkgs; [

    ];
  in []
  ++ hyprland-desktop-pkgs
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
