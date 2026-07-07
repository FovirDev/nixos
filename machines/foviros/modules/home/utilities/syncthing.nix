{ pkgs, ... }: {
  home.packages = [ pkgs.syncthing ];
  wayland.windowManager.hyprland.settings.exec-once = [ "syncthing --no-browser" ];
}
