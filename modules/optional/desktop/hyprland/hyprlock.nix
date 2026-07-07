{ ... }: {
  programs.hyprlock.enable = true;
  wayland.windowManager.hyprland.settings.bind = [ "$mod,P,exec,hyprlock" ];
}
