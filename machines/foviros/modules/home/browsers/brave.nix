{ pkgs, ... }: {
  programs.chromium = {
    enable = true;

    commandLineArgs = [
      "--enable-wayland-ime"
      "--ozone-platform-hint=auto"
      "--ozone-platform=wayland"
      "--password-store=basic"
    ];
    package = pkgs.brave;
  };
}
