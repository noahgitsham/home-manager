{ pkgs, ... } : {
  home.packages = with pkgs; [
    btop
    bc
    chafa
    ffmpeg
    file
    fzf
    lf
    lsix
    ripgrep
    p7zip
    tokei
    tree
    unzip
    wget
    xdg-ninja
    xdragon
    zip
  ];

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-dash ];
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
    };
  };
}
