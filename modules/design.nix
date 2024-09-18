{ pkgs, ... } :
{
  home.packages = with pkgs; [
    blender 
    inkscape
    krita
    gimp
  ];
}
