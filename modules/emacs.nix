{ pkgs, ... } :
{
  programs.emacs = {
    enable = true;
    # package = pkgs.stdenv.mkDerivation rec {
    #   pname = "emacs-clean-desktop-entries";
    #   inherit (pkgs.emacs) version buildInputs propagatedBuildInputs;
    #   dontBuild = true;
    #   dontUnpack = true;
    #   installPhase = ''
    #   ${pkgs.rsync}/bin/rsync -ax --exclude "share/applications/.*[!emacs.desktop]" ${pkgs.emacs} $out
    #   ${pkgs.tree}/bin/tree $out
    #   '';
    # };
    extraPackages = epkgs : with pkgs; [
      python3
    ];
  };

  home.packages = [ pkgs.texliveFull ];
}
