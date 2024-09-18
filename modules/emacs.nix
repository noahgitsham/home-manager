{ pkgs, ... } :
{
  programs.emacs = {
    enable = true;
    # package = pkgs.emacs.overrideAttrs ({ postInstall ? "", ... }: {
    #   postInstall = postInstall + ''
    #   ls
    #   ls share
    #   ls share/applications
    #   rm share/applications/emacsclient.desktop
    #   '';
    # });
  };

  # services.emacs = {
    #   enable = true;
    #   client.enable = true;
    # };
  }
