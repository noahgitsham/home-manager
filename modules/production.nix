{ pkgs, ... } :
let 
  plugins = with pkgs; [
    vital
    helm
    surge-XT
  ];
in {
  home.packages = with pkgs; [
    ardour
    reaper
    mixxx
  ] ++ plugins;
}
