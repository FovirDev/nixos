{ pkgs, ... }: {
  home.packages = with pkgs; [
    dsniff
    ghidra
    metasploit
    nmap
    recon-ng
    sqlmap
    zap
  ];
}
