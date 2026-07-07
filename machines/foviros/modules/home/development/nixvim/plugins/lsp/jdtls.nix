{ ... }: {
  plugins.lsp.servers.jdtls = {
    enable = true;

    extraOptions.handlers.__raw = ''
      {
         ['language/status'] = function(_, result)
         end,
         ['$/progress'] = function(_, result, ctx)
         end,
      },
    '';
  };
}
