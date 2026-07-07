{ ... }: {
  plugins.lsp.servers.gopls = {
    enable = true;
    filetypes = [
      "go"
      "gotmpl"
      "html"
    ];
    settings = {
      gopls = {
        hints = {
          assignVariableTypes = true;
          compositeLiteralFields = true;
          constantValues = true;
          functionTypeParameters = true;
          parameterNames = true;
          rangeVariableTypes = true;
        };
        templateExtensions = [
          ".html"
          ".tmpl"
          ".gohtml"
        ];
      };
    };
  };
}
