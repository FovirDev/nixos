{ pkgs, ... }: {
  home.packages = with pkgs; [ stable-motrix-next.motrix-next ];
}
