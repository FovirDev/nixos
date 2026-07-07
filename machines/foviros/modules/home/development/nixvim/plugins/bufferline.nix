{ ... }: {
  plugins.bufferline = {
    enable = true;

    settings.options = {
      always_show_bufferline = true;
      buffer_close_icon = "󰅖";
      custom_filter = ''
        function(bufnr)
          local name = vim.api.nvim_buf_get_name(bufnr)
          return not name:match("^term://")
        end
      '';
      close_icon = "";
      diagnostics = "nvim_lsp";
      numbers = "ordinal";
      offsets = [
        {
          filetype = "neo-tree";
          highlight = "Directory";
          text = "File Explorer";
          text_align = "center";
        }
      ];
    };
  };

  keymaps = (
    builtins.genList (
      i:
      let
        n = i + 1;
      in
      {
        mode = "n";
        key = "<M-${toString n}>";
        action = "<cmd>BufferLineGoToBuffer ${toString n}<CR>";
        options.desc = "Go to Buffer ${toString n}";
      }
    ) 9
  );
}
