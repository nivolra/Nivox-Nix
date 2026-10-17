# Module for Firewall Configuration on NixOS

{ ... }:

{ 
  # Enable the Firewall.
  networking.firewall.enable = true;

  # Manage Ports.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
