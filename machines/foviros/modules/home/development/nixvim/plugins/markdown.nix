{ ... }: {
  plugins.markdown-preview.enable = true;

  keymaps = [
    {
      action = "<cmd>MarkdownPreviewToggle<CR>";
      key = "<leader>m";
      mode = "n";
      options.desc = "Toggle Markdown Preview";
    }
  ];
}
