{ config, pkgs, ... }:

let 
  tty-clock-triple-1 = pkgs.tty-clock.overrideAttrs {
    name = "tty-clock-triple-1";
    src = pkgs.fetchFromGitHub {
      owner = "noahgitsham";
      repo = "tty-clock-triple-1";
      rev = "754afaa";
      hash = "sha256-dz66niEnw0scOUqOf9sSYHcwZ8EUqCPZupgG4JW/jEc=";
    };
    patches = [];
  };
in {
  home.packages = [
    tty-clock-triple-1
  ];
}

