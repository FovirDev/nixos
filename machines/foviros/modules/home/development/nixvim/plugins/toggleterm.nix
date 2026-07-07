{ ... }: {
  plugins.toggleterm = {
    enable = true;

    settings = {
      autochdir = true;
      direction = "float";
      open_mapping = "[[<C-`>]]";
      persist_size = false;

      float_opts =
        let
          scale = "0.9";
        in
        {
          border = "rounded";
          height.__raw = ''
            function(term)
              return math.floor(vim.o.lines * ${scale})
            end
          '';
          width.__raw = ''
            function(term)
              return math.floor(vim.o.columns * ${scale})
            end
          '';
        };
    };
  };

  extraConfigLua = ''
    function RunCurrentFile()
      local runners = {
        py = "python -u %s",
        c = "clang -o %s *.c -g && ./%s",
        cpp = "clang++ -o %s *.cpp -g && ./%s",
        go = "go run %s",
        js = "node %s",
        ts = "npx tsx %s",
        java = "javac -d out *.java && cd out/ && java %s ; cd ..",
        rs = "cargo run"
      }

      local filename = vim.fn.expand("%:t")
      local filename_without_ext = vim.fn.expand("%:t:r")
      local ext = vim.fn.expand("%:e")
      local file_dir = vim.fn.expand("%:p:h")

      local cmd_template = runners[ext]

      if cmd_template then
        local cmd
        if cmd_template:match("%%s.-%%s") then
          cmd = string.format(cmd_template, filename_without_ext, filename_without_ext)
        elseif ext == "java" then
          cmd = string.format(cmd_template, filename_without_ext)
        else
          cmd = string.format(cmd_template, filename)
        end

        cmd = string.format("cd %s && %s ; cd - > /dev/null", file_dir, cmd)

        vim.cmd("TermExec cmd='" .. cmd .. "'")
      else
        print("No code runner.")
      end
    end
  '';

  keymaps = [
    {
      key = "<leader>5";
      mode = "n";
      action = ":lua RunCurrentFile()<CR>";
      options.desc = "Run Code";
    }
    {
      key = "<F5>";
      mode = "n";
      action = ":lua RunCurrentFile()<CR>";
      options.desc = "Run Code";
    }
  ];
}
