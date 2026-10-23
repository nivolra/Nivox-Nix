# Module for SSH Connections on NixOS

{ ... }:

{

  # NIVOS COMMENT
  # If you don't want to connect to your local machine via SSH, omit the module.

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
