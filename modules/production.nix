{ pkgs, ... } :
let 
  plugins = with pkgs; [
    vital
    surge-XT
  ];
  workspaces = with pkgs; [
    ardour
    audacity
    reaper
    mixxx
  ];
in {
  home.packages = with pkgs; [
    jamesdsp
  ] ++ workspaces ++ plugins;

  systemd.user.sessionVariables = {
    LV2_PATH = "$HOME/.local/state/nix/profile/lib/lv2";
  };
}
