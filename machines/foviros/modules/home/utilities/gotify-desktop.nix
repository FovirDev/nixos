{ pkgs, ... }: {
  home.packages = with pkgs; [ gotify-desktop ];
  wayland.windowManager.hyprland.settings.exec-once = [ "gotify-desktop" ];
  xdg.configFile."gotify-desktop/config.toml".source =
    ../../../values/gotify-desktop-config-file.toml;
}
