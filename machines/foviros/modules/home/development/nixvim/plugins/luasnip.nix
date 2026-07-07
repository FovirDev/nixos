{ ... }: {
  plugins = {
    cmp_luasnip.enable = true;
    luasnip = {
      enable = true;

      settings.enable_autosnippets = true;
    };
  };
}
