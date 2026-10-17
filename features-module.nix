# Module for Experimental Features in NixOS

{ ... }:

{
  # Allow experimental features in NixOS.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
