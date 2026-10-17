# Module for Virtualization and Containers on NixOS

{ pkgs, ... }:

{
  # System Packages.
  environment.systemPackages = with pkgs; [
    dnsmasq
    distrobox
  ];

  # Enable Virtualization support.
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Enable Podman support.
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # Creates a symlink from docker to podman
  };
}
