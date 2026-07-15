{ ... }: {
  home.file = {
    ".prettierrc".text = ''
      {
        "printWidth": 72
      }
    '';

    ".editorconfig".text = ''
      root = true

      [*]
      insert_final_newline = true
      end_of_line = lf
      charset = utf-8
    '';
  };
}
