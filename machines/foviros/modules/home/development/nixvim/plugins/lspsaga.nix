{ ... }: {
  plugins.lspsaga = {
    enable = true;

    settings = {
      code_action.keys.quit = "<esc>";
      lightbulb.enable = false;
      rename.keys.quit = "<esc>";
      symbol_in_winbar.enable = true;
    };
  };

  keymaps = [
    {
      action = "<cmd>Lspsaga finder<CR>";
      key = "gi";
      mode = "n";
      options.desc = "Show References";
    }
    {
      action = "<cmd>Lspsaga finder imp<CR>";
      key = "gI";
      mode = "n";
      options.desc = "[G]o to [I]mplement";
    }
    {
      action = "<cmd>Lspsaga hover_doc<CR>";
      key = "<S-k>";
      mode = "n";
      options.desc = "Hover Doc";
    }
    {
      action = "<cmd>Lspsaga outline<CR>";
      key = "<leader>a";
      mode = "n";
      options.desc = "Toggle Outline";
    }
    {
      action = "<cmd>Lspsaga show_buf_diagnostics<CR>";
      key = "<leader>db";
      mode = "n";
      options.desc = "[D]iagnostic [B]uffer";
    }
    {
      action = "<cmd>Lspsaga show_workspace_diagnostics<CR>";
      key = "<leader>dw";
      mode = "n";
      options.desc = "[D]iagnostic [W]orkspace";
    }
    {
      key = "<C-.>";
      mode = "n";
      action = "<cmd>Lspsaga code_action<CR>";
      options.desc = "Code Action";
    }
    {
      key = "<F2>";
      mode = "n";
      action = "<cmd>Lspsaga rename<CR>";
      options.desc = "Rename";
    }
    {
      key = "<F3>";
      mode = "n";
      action = "<cmd>Lspsaga peek_definition<CR>";
      options.desc = "Peek Definition";
    }
    {
      key = "<leader>2";
      mode = "n";
      action = "<cmd>Lspsaga rename<CR>";
      options.desc = "Rename";
    }
    {
      key = "<leader>3";
      mode = "n";
      action = "<cmd>Lspsaga peek_definition<CR>";
      options.desc = "Peek Definition";
    }
    {
      key = "<leader>dn";
      mode = "n";
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      options.desc = "[D]iagnostic [N]ext";
    }
    {
      key = "<leader>dp";
      mode = "n";
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      options.desc = "[D]iagnostic [P]revious";
    }
  ];
}
