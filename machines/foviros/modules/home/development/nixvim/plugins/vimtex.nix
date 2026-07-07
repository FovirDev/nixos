{ pkgs, ... }: {
  extraPackages = [ pkgs.nodejs ];

  plugins.vimtex = {
    enable = true;
    texlivePackage = pkgs.texliveFull;
    settings = {
      compiler_method = "latexmk";
      latexmk_options = "-pdf -pvc";
      quickfix_mode = 0;
      tex_auto_close = 1;
      tex_brace_capture = 1;
      tex_conceal = "abdmg";
      tex_delim_pairs = 1;
    };
  };
}
