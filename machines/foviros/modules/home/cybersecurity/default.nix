{ pkgs, ... }: {
  home.packages = with pkgs; [
    dsniff
    ghidra
    hashcat
    metasploit
    nmap
    recon-ng
    sqlmap
    unstable.autopsy
    unstable.sleuthkit
    zap
  ];
}
