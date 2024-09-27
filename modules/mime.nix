{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["zathura.desktop"];
    };
    defaultApplications = {
      "text/*" = ["neovim.desktop"];
      "application/pdf" = ["zathura.desktop"];
      "x-scheme-handler/http" = ["librewolf.desktop"];
      "text/html" = ["librewolf.desktop"];
      "text/xml" = ["librewolf.desktop"];
      "application/xhtml_xml" = ["librewolf.desktop"];
      "image/webp" = ["librewolf.desktop"];
      "x-scheme-handler/https" = ["librewolf.desktop"];
      "x-scheme-handler/ftp" = ["librewolf.desktop"];
    };
  };
}
