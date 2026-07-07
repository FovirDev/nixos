{ pkgs, ... }:
let
  strawberry = "strawberry";
in
{
  home.packages = [ pkgs.${strawberry} ];
  wayland.windowManager.hyprland.settings = {
    exec-once = [ strawberry ];
    windowrule = [ "match:class .*${strawberry}.*, workspace special" ];
  };
  xdg.configFile."strawberry/strawberry.conf".source = ./strawberry.conf;
}
