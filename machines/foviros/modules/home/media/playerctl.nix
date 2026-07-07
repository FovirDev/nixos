{ pkgs, ... }: {
  home.packages = [ pkgs.playerctl ];
  wayland.windowManager.hyprland.settings.bind = [
    "CTRL_ALT,N,exec,playerctl next"
    "CTRL_ALT,P,exec,playerctl previous"
    "CTRL_ALT,SPACE,exec,playerctl play-pause"
  ];
}
