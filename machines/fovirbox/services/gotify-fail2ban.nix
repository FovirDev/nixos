{
  lib,
  pkgs,
  ...
}:
let
  gotify-fail2ban-url = import ../values/gotify-fail2ban-url.nix;
in
{
  environment.etc."fail2ban/action.d/gotify.local".text = pkgs.lib.mkDefault (
    pkgs.lib.mkAfter ''
      [Definition]
      norestored = true

      actionban = curl "${gotify-fail2ban-url}" -F "title=[Fail2Ban] <ip> banned" -F "message=<name> jail has banned <ip> on $(hostname) after <failures> failed attempts." -F "priority=3"

      actionunban = curl "${gotify-fail2ban-url}" -F "title=[Fail2Ban] <ip> unbanned" -F "message=<name> jail has unbanned <ip> on $(hostname)." -F "priority=2"
    ''
  );

  services.fail2ban = {
    extraPackages = with pkgs; [
      curl
      hostname
    ];
    jails.sshd.settings.action = lib.mkForce ''nftables-multiport[name=sshd, port="ssh", protocol=tcp] gotify'';
  };
}
