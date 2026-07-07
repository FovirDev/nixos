{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.hyprshell.homeModules.hyprshell ];

  programs.hyprshell = {
    enable = true;

    package = inputs.hyprshell.packages.${pkgs.stdenv.hostPlatform.system}.hyprshell-nixpkgs;
    systemd.args = "-v";
    styleFile = ./styles.css;
    settings = {
      windows = {
        enable = true;

        items_per_row = 5;
        overview.enable = false;
        scale = 8.5;
        switch = {
          enable = true;

          filter_by = [
            "current_monitor"
          ];
          modifier = "alt";
          switch_workspaces = false;
        };
      };
    };
  };

  wayland.windowManager.hyprland.settings = {
    bind = [ "$mod SHIFT, R, exec, restart-hyprshell" ];
    layerrule = [ "match:namespace .*hyprshell.*, no_anim on" ];
  };

  home = {
    file.".local/bin/restart-hyprshell" = {
      executable = true;
      force = true;
      text = ''
        #!/usr/bin/env bash
        pkill hyprshell ; hyprshell run -q &
      '';
    };
    sessionVariables = {
      HYPRSHELL_NO_USE_PLUGIN = "1";
    };
  };
}
