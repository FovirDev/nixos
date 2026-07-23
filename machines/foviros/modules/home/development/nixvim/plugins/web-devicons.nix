{ ... }: {
  plugins.web-devicons.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      vimPlugins = prev.vimPlugins // {
        nvim-web-devicons = prev.vimPlugins.nvim-web-devicons.overrideAttrs (_old: {
          version = "unstable-2026-07-23";
          src = final.fetchFromGitHub {
            owner = "nvim-tree";
            repo = "nvim-web-devicons";
            rev = "2ae6958df7ced50baac5035cec0c15799eedfbf7";
            hash = "sha256-/NTrUcytMahe5wZUjVO9a4D9vooKtAQu/cKgOugeZNk=";
          };
        });
      };
    })
  ];
}
