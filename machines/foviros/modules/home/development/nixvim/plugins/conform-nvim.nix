{ pkgs, ... }: {
  extraPackages = with pkgs; [
    black
    gofumpt
    google-java-format
    nixfmt
    pgformatter
    prettier
    prettier-plugin-go-template
    taplo
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = ''
        function(bufnr)
          return {lsp_fallback = true}
        end
      '';

      formatters_by_ft = {
        "_" = [ "prettier" ];
        "c" = [ "clang_format" ];
        "cpp" = [ "clang_format" ];
        "gleam" = [ "gleam format" ];
        "go" = [
          "goimports"
          "gofumpt"
        ];
        "java" = [ "google-java-format" ];
        "nix" = [ "nixfmt" ];
        "python" = [ "black" ];
        "rust" = [ "rustfmt" ];
        "sql" = [ "pg_format" ];
        "tex" = [ "latexindent" ];
        "toml" = [ "taplo" ];
      };
      formatters = {
        gofumpt.append_args = [ "-extra" ];
        pg_format.append_args = [
          "-u"
          "0"
          "-U"
          "0"
          "--no-extra-line"
        ];
      };
    };
  };
}
