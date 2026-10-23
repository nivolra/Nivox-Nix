# Module for automating GCs, Nix Store Optimization 

{ ... }:

{

  # NIVOS COMMENT
  # To prevent wasting space, these options will regularly check for way to improve Nix Store usage.
  # Additionally, automatic upgrades ensure your system will stay up to date.
  # This does not absolve YOUR RESPONSIBILITY to check the health of your system!

  # Optimize Nix Store.
  nix.optimise.automatic = true;
  # nix.optimise.dates = [ "03:45" ]; # Optional; allows customizing optimisation schedule

  # Garbage Collection.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Automatic Upgrades (Channel based).
  system.autoUpgrade = {
    enable = true;
    dates = "12:00";
    randomizedDelaySec = "45min";
    allowReboot = false;  # Set to true if you want automatic reboots
  };
}
