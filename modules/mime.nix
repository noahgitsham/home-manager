let 
  text = (map (x:"text/${x}") [
    "plain"
  ]);
  code = (map (x:"text/${x}") [
    "css"
    "html"
    "javascript"
    "troff"
    "x-asm"
    "x-c"
    "x-chdr"
    "x-c++"
    "x-c++src"
    "x-fortran"
    "x-java-source"
    "x-pascal"
    "x-python"
    "x-"
  ]);
in {
  xdg.mimeApps = let 
    browsers = ["librewolf.desktop" "firefox.desktop" "chromium-browser.desktop"];
    image-viewers = ["imv-dir.desktop"] ++ browsers;
    text-editors = ["nvim.dekstop" "emacs.desktop" "nano.desktop"];
    video-players = ["mpv.desktop"] ++ browsers;
    audio-players = ["mpv.desktop"] ++ browsers;
  in {
    enable = true;
    defaultApplications = {
      "text/plain" = text-editors;
      "text/org" = ["emacs.desktop" "neovim.desktop"];
      "application/pdf" = ["org.pwmt.zathura.desktop"];
      "x-scheme-handler/http" = browsers;
      "text/html" = browsers;
      "text/xml" = browsers;
      "application/xhtml_xml" = browsers;

      "image/avif" = image-viewers;
      "image/bmp" = image-viewers;
      "image/gif" = image-viewers;
      "image/heif" = image-viewers;
      "image/jpeg" = image-viewers;
      "image/jpg" = image-viewers;
      "image/pjpeg" = image-viewers;
      "image/png" = image-viewers;
      "image/tiff" = image-viewers;
      "image/x-bmp" = image-viewers;
      "image/x-pcx" = image-viewers;
      "image/x-png" = image-viewers;
      "image/x-portable-anymap" = image-viewers;
      "image/x-portable-bitmap" = image-viewers;
      "image/x-portable-graymap" = image-viewers;
      "image/x-portable-pixmap" = image-viewers;
      "image/x-tga" = image-viewers;
      "image/x-xbitmap" = image-viewers;

      "audio/x-wav" = audio-players;
      "audio/mpeg" = audio-players;
      "audio/mp3" = audio-players;
      "audio/mp4" = audio-players;
      "audio/ogg" = audio-players;
      "audio/flac" = audio-players;

      "video/*" = video-players;

      "image/webp" = browsers;
      "x-scheme-handler/https" = browsers;
      "x-scheme-handler/ftp" = browsers;

      "inode/directory" = ["thunar.desktop" "lf.desktop"];
    };
  };
}
