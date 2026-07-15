{ ... }: {
  programs.chromium = {
    enable = true;

    extensions = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "dbepggeogbaibhgnhhndojpepiihcmeb" # Vimium
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "emeeapjkbcbpbpgaagfchmcgglmebnen" # Surf Wallet
    ];
  };
}
