{ pkgs, ... } : {
  home.packages = with pkgs; [
    gnome-decoder
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # systemd.enable = false;
  };
  # services.hypridle.enable = true;
  # programs.hyprlock.enable = true;
}
