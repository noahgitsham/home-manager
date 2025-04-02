{ pkgs, ... } : {
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
