{ username }: {
  imports = [
    (import ./software { inherit username; })
    ./system
  ];
}
