# Module for Gaming Support on NixOS

{ pkgs, ... }:

{
  # System Packages
  environment.systemPackages = with pkgs; [
    mangohud
    # protonplus
  ];

  # Enable Gamemode Daemon.
  programs.gamemode.enable = true;

  # Enable Gamescope Compositor.
  # programs.gamescope.enable = true; # Optional Gaming Compositor from Valve

  # NIVOS COMMENT
  # Since I personally use Flatpaks to manage my Gaming Platforms, these values are commented out by default.
  # In case you want NixOS to manage these, uncomment the following program lines for both Steam and Heroic to be installed.

  # Allow Any Unfree package - Necessary for Steam!
  # nixpkgs.config.allowUnfree = true;

  # Steam Client Configuration.
  # programs.steam.enable = true;

  # Heroic Games Launcher Configuration.
  # programs.heroic.enable = true;
}
