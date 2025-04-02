{ pkgs, ... } :
{
  home.file = {
    ".config/xinitrc" = {
      text = ''
      sxhkd &
      exec bspwm
      '';
    };
  };
}
