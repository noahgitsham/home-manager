{ pkgs, ... } : {
  home.packages = with pkgs; [
    lf
    xdragon
    chafa
    file
    ffmpeg

    btop
    fzf
    ripgrep
    lsix
    tree
    unzip

    xdg-ninja

    gh
    gh-dash
  ];

  programs.bat = {
    enable = true;
  };
}
