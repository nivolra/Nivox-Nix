# Module for Theming your Desktop in NixOS

{ pkgs, ... }:

{

  # NIVOS COMMENT
  # In case you're perfectly content with the defaults of your system, omit this module.

  fonts.packages = with pkgs; [
    
    # Nerd Fonts.
    nerd-fonts.hurmit 
    nerd-fonts.jetbrains-mono
  
  ];

  environment.systemPackages = with pkgs; [

    # Bibata Mouse Cursor Theme.
    bibata-cursors

    # Papirus Icon Theme with custom color.
    (papirus-icon-theme.override { color = "adwaita"; }) 

  ];

}
