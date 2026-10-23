# Module for Software Management on NixOS

{ pkgs, ... }:

{
  
  # NIVOS COMMENT
  # To have more choices in terms of software deployment, I include Flatpak and AppImage support.
  # These packages are NOT handled by Nixpkgs, and therefore will be left untouched on rollback events.
  # If you want to manage your system, using nixpkgs exclusively, omit this module.

  # Allow ALL unfree packages in the Nixpkgs repository.
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
