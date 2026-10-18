{ ... }: {
  imports = [
    # ./move_analyzer.nix
    ./asm_lsp.nix
    ./buf_ls.nix
    ./clangd.nix
    ./cmake.nix
    ./cssls.nix
    ./gleam.nix
    ./golangci_lint_ls.nix
    ./gopls.nix
    ./html.nix
    ./jdtls.nix
    ./jsonls.nix
    ./just.nix
    ./lemminx.nix
    ./ltex.nix
    ./nixd.nix
    ./pyright.nix
    ./rust_analyzer.nix
    ./sqls.nix
    ./svelte.nix
    ./tailwindcss.nix
    ./ts_ls.nix
    ./yamlls.nix
  ];

  plugins.lsp = {
    enable = true;

    inlayHints = true;
  };

  keymaps = [
    {
      action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
      key = "<leader>ti";
      mode = "n";
      options.desc = "[T]oggle [I]nlay Hints";
    }
  ];
}
