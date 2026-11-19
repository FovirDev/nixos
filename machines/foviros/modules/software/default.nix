{ username, ... }: {
  imports = [
    # ./tailscale.nix
    (import ../../values/sci.nix { inherit username; })
    ./chromium.nix
    ./direnv.nix
    ./ollama.nix
    ./wireshark.nix
  ];
}
