# Module for Experimental Features in NixOS

{ ... }:

{
  
  # NIVOS COMMENT
  # I only enabled these settings here, because I plan to transition to flakes in the future.
  # If you are content with the Channel based configuration modules, omit this module.

  # Allow experimental features in NixOS.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
