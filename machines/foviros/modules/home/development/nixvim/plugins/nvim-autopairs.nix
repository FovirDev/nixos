{ ... }: {
  # Auto pair brackets.
  plugins.nvim-autopairs = {
    enable = true;

    luaConfig.post = ''
      local Rule = require("nvim-autopairs.rule")
      require("nvim-autopairs").add_rules({
        Rule("/*", "*/", {"c", "cpp", "java", "javascript", "typescript", "css"})
          :with_move(function(opts)
            return opts.char == "/"
          end)
          :with_pair(function(opts)
            return opts.prev_char:match(".%*/") == nil
          end)
          :use_key("*"),
        Rule("**", "**", {"markdown"})
          :with_pair(function(opts)
            return opts.line:sub(opts.col - 1, opts.col) ~= "**"
          end)
          :with_move(function(opts)
            return opts.prev_char:match(".%*")
          end)
          :use_key("*"),
      })
    '';
  };
}
