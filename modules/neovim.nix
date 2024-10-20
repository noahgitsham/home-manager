{ pkgs, ... } : {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      python3
      nodejs
      gcc
      clang
      unzip
      rustup
      typescript
      ripgrep
      tree-sitter
      texlivePackages.latexmk
    ];
    defaultEditor = true;
  };
}
