{ ... }: {
  plugins.opencode.enable = true;

  keymaps = [
    {
      action = ''<cmd>lua require("opencode").ask("@this: ", { submit = true })<CR>'';
      key = "<leader>oca";
      mode = [
        "n"
        "v"
      ];
      options.desc = "[O]pen[C]ode [A]sk";
    }
    {
      action = ''<cmd>lua require("opencode").select()<CR>'';
      key = "<leader>ocs";
      mode = [
        "n"
        "v"
      ];
      options.desc = "[O]pen[C]ode [S]elect";
    }
    {
      action = ''<cmd>lua require("opencode").toggle()<CR>'';
      key = "<leader>oct";
      mode = [ "n" ];
      options.desc = "[O]pen[C]ode [T]oggle";
    }
  ];
}
