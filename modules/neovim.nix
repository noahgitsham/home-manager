{ pkgs, ... } : {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      clang
      gcc
      nodejs
      python3
      ripgrep
      rustup
      texlivePackages.latexmk
      tree-sitter
      typescript
      unixtools.xxd
      unzip
    ];
    defaultEditor = true;
  };
}
