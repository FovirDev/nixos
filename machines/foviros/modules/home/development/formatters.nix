{pkgs, ...}: {
  home.packages = with pkgs; [
    black
    google-java-format
    nixfmt
    pgformatter
    prettier
    prettier-plugin-go-template
    taplo
    xmlstarlet
  ];

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
