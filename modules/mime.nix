{
  xdg.mimeApps = let 
    image-viewer = "imv.desktop";
  in {
    enable = true;
    defaultApplications = {
      "text/*" = ["neovim.desktop"];
      "text/org" = ["emacs.desktop"];
      "application/pdf" = ["org.pwmt.zathura.desktop"];
      "x-scheme-handler/http" = ["librewolf.desktop"];
      "text/html" = ["librewolf.desktop"];
      "text/xml" = ["librewolf.desktop"];
      "application/xhtml_xml" = ["librewolf.desktop"];
      "image/bmp" = [image-viewer];
      "image/gif" = [image-viewer];
      "image/jpeg" = [image-viewer];
      "image/jpg" = [image-viewer];
      "image/pjpeg" = [image-viewer];
      "image/png" = [image-viewer];
      "image/tiff" = [image-viewer];
      "image/x-bmp" = [image-viewer];
      "image/x-pcx" = [image-viewer];
      "image/x-png" = [image-viewer];
      "image/x-portable-anymap" = [image-viewer];
      "image/x-portable-bitmap" = [image-viewer];
      "image/x-portable-graymap" = [image-viewer];
      "image/x-portable-pixmap" = [image-viewer];
      "image/x-tga" = [image-viewer];
      "image/x-xbitmap" = [image-viewer];
      "image/heif" = [image-viewer];
      "image/avif" = [image-viewer];

      "image/webp" = ["librewolf.desktop"];
      "x-scheme-handler/https" = ["librewolf.desktop"];
      "x-scheme-handler/ftp" = ["librewolf.desktop"];
      "inode/directory" = ["thunar.desktop" "lf.desktop"];
    };
  };
}
