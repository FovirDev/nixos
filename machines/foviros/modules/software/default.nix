{ username, ... }: {
  imports = [
    # ./tailscale.nix
    (import ./sci.nix { inherit username; })
    ./chromium.nix
    ./direnv.nix
    ./ollama.nix
    ./wireshark.nix
  ];
}
