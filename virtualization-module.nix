# Module for Virtualization and Containers on NixOS

{ pkgs, ... }:

{ 
  # NIVOS COMMENT
  # Containers and VMs enable me to run complex development workloads without polluting my system.
  # If you don't plan on using containers or VMs, omit this module

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
    # dockerCompat = true; # Creates a symlink from docker to podman
  };
}
