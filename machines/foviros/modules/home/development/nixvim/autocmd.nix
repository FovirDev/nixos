{
  autoCmd = [
    {
      command = ''lua vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }'';
      event = [ "TextYankPost" ];
      pattern = [ "*" ];
      desc = "Highlight on yank.";
    }
    {
      command = "if mode() != 'c' && getcmdwintype() == '' | checktime | endif";
      event = [
        "BufEnter"
        "CursorHold"
        "CursorHoldI"
        "FocusGained"
        "VimResume"
      ];
      pattern = "*";
      desc = "Automatically checktime";
    }
    {
      event = [ "BufEnter" ];
      callback.__raw = ''
        function(args)
          local bufname = vim.api.nvim_buf_get_name(args.buf)
          if bufname == "" then
            return
          end
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if buf ~= args.buf
              and vim.api.nvim_buf_is_loaded(buf)
              and vim.api.nvim_buf_get_name(buf) == ""
              and not vim.bo[buf].modified
              and vim.bo[buf].buflisted
            then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end
      '';
      desc = "Automatically remove no name buffers";
    }
  ];
}
