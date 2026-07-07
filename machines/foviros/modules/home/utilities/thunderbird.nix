{ pkgs, ... }:
let
  thunderbird = "thunderbird";
in
{
  home.packages = [ pkgs.${thunderbird} ];
  wayland.windowManager.hyprland.settings = {
    exec-once = [ thunderbird ];
    windowrule = [ "match:class .*${thunderbird}.*, workspace special" ];
  };
}
