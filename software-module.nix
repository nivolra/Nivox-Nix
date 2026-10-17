# Module for Software Management on NixOS

{ config, pkgs, ... }:

{
  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Enable Flatpak.
  services.flatpak.enable = true;

  # Enable AppImage Support.
  programs.appimage = {
    enable = true;
    binfmt = true;
    #  package = pkgs.appimage-run.override {
      #  extraPkgs = pkgs: [
        # pkgs.squashfuse
        # pkgs.squashfsTools
        # pkgs.icu
        # pkgs.libxcrypt-legacy
        # pkgs.python312
        # pkgs.python312Packages.torch
      #  ];
    #  }
  };
}
