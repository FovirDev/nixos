{ ... }: {
  plugins = {
    noice = {
      enable = true;

      settings = {
        lsp.enabled = true;
        presets.command_palette = true;
        routes = [
          {
            filter = {
              event = "msg_show";
              any = [
                { find = "Hop"; }
                { find = "hop"; }
              ];
            };
            opts = {
              skip = true;
            };
          }
        ];
        views.cmdline_popup.size = {
          width = "50%";
          height = "auto";
        };
      };
    };
    notify = {
      enable = true;

      settings = {
        timeout = 1;
        top_down = false;
      };
    };
  };
}
