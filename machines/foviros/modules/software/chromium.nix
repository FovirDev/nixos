{ ... }: {
  programs.chromium = {
    enable = true;

    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "emeeapjkbcbpbpgaagfchmcgglmebnen" # Surf Wallet
    ];
  };
}
