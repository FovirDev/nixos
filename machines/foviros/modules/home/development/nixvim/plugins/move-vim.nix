{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "move.vim";
      version = "sui-move";
      src = pkgs.fetchFromGitHub {
        owner = "yanganto";
        repo = "move.vim";
        rev = "sui-move";
        sha256 = "sha256-QKUY9Xk9sYGXkf8uaWCBI6Tv2rhRLISY5UZLjU5eors=";
      };
    })
  ];
}
