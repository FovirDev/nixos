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
  ];
}
