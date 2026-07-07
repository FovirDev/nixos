{ username }: {
  home-manager.users.${username} =
    { lib, ... }:
    with lib;
    {
      programs.fuzzel = {
        enable = true;

        settings = {
          colors = {
            background = "1e1e2edd";
            border = "b4befeff";
            counter = "7f849cff";
            input = "cdd6f4ff";
            match = "b4befeff";
            placeholder = "7f849cff";
            prompt = "bac2deff";
            selection = "585b70ff";
            selection-match = "b4befeff";
            selection-text = "cdd6f4ff";
            text = "cdd6f4ff";
          };
          main = {
            delayed-filter-limit = 0;
            delayed-filter-ms = 0;
            font = mkDefault "JetBrainsMono Nerd Font Mono:size=14";
            icon-theme = mkDefault "BeautyLine";
            icons-enabled = true;
            lines = 15;
            sort-result = "yes";
            width = 60;
          };
        };
      };
      wayland.windowManager.hyprland.settings.bind = [ "ALT,SPACE,exec,fuzzel" ];
    };
}
