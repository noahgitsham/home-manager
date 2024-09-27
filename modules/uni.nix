{ pkgs, ... } : {
  home.packages = with pkgs.texlivePackages; [
    scheme-full
    latexmk
  ];
}
