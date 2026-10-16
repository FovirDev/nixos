{ ... }: {
  plugins.aerial = {
    enable = true;

    settings = {
      open_automatic = false;
      filter_kind = false;
      show_guides = true;
      layout.default_direction = "right";
      keymaps = {
        "o" = "actions.scroll";
      };
    };
  };

  keymaps = [
    {
      action = "<cmd>AerialToggle<CR>";
      key = "<leader>a";
      mode = "n";
      options.desc = "Toggle Outline";
    }
  ];
}
