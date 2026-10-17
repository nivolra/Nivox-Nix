# Module for SSH Connections on NixOS

{ ... }:

{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "nivolra" ];
      MaxAuthTries = 7;
      PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
    };
  };
}
