{ pkgs, ... }: {
  home.packages = with pkgs; [
    dsniff
    ghidra
    metasploit
    nmap
    sqlmap
    zap
  ];
}
