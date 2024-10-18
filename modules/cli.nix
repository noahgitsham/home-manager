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

    xdg-ninja
  ];

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-dash ];
  };

  programs.bat = {
    enable = true;
  };
}
