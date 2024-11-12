{ pkgs, ... } : {
  home.packages = with pkgs; [
    btop
    chafa
    ffmpeg
    file
    fzf
    lf
    lsix
    ripgrep
    tree
    wget
    xdg-ninja
    xdragon
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
