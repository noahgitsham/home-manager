{ pkgs, ... } :
let 
  plugins = with pkgs; [
    vital
    surge-XT
  ];
in {
  home.packages = with pkgs; [
    ardour
    reaper
    mixxx
    jamesdsp
  ] ++ plugins;

  systemd.user.sessionVariables = {
    LV2_PATH = "$HOME/.local/state/nix/profile/lib/lv2";
  };
}
