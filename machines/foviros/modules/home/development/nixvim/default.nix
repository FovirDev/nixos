{
  inputs,
  pkgs,
  ...
}:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    diagnostic.settings.virtual_text = true;
    editorconfig.enable = true;
    globals.mapleader = " "; # Set space as the leader key.
    nixpkgs.pkgs = pkgs;
    imports = [
      ./autocmd.nix
      ./colorscheme.nix
      ./keymaps.nix
      ./opts.nix
      ./plugins
      ./usercommands.nix
    ];
  };
}
