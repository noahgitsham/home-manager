{ pkgs, ... } : {
  home.packages = with pkgs; [
    lf
    btop
    xdg-ninja
    bat
    fzf
    ripgrep

    gh
    gh-dash
  ];
}
