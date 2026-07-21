{
  config,
  pkgs,
  ...
}:
{
  home = {
    file.".local/bin/run-oculante" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        env -u WAYLAND_DISPLAY oculante $1
      '';
    };
    packages = [ pkgs.oculante ];
  };
  xdg.desktopEntries.oculante = {
    exec = "${config.home.homeDirectory}/.local/bin/run-oculante";
    icon = "oculante";
    name = "Oculante";
    genericName = "Image Viewer";
    mimeType = [
      "image/bmp"
      "image/gif"
      "image/vnd.microsoft.icon"
      "image/jpeg"
      "image/jp2"
      "image/png"
      "image/pnm"
      "image/x-tga"
      "image/jxl"
      "image/avif"
      "image/tiff"
      "image/webp"
      "image/octet-stream"
      "application/dicom"
      "application/vnd.adobe.photoshop"
      "image/svg+xml"
      "image/exr"
      "image/x-exr"
      "image/x-dcraw"
      "image/x-nikon-nef"
      "image/x-canon-cr2"
      "image/x-adobe-dng"
      "image/x-epson-erf"
      "image/x-fuji-raf"
      "image/x-sony-arw"
      "image/x-sony-srf"
      "image/x-sony-sr2"
      "image/x-panasonic-raw/x-portable-pixmap"
      "image/heic"
      "image/x-qoi"
      "image/"
    ];
  };
}
