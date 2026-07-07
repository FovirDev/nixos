{ ... }: {
  plugins.colorizer = {
    enable = true;

    settings = {
      filetypes = [
        "css"
        "html"
        "javascript"
        "javascriptreact"
        "scss"
      ];

      user_default_options = {
        mode = "virtualtext";
        virtualtext = "";
      };
    };
  };
}
