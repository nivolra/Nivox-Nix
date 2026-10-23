# Module for Firewall Configuration on NixOS

{ ... }:

{ 
  # Enable the Firewall.
  networking.firewall.enable = true;

  # NIVOS COMMENT
  # Port 22 is for SSH Connections. Omit it if you don't want remote connections onto your hardware to be a possibility!

  # Manage Ports.
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
