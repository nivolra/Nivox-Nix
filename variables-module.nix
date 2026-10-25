# Module for Environment Variables in NixOS

{ ... }:

{
  environment.sessionVariables = {
    
    # Allow Theming of QT Apps.
    QT_QPA_PLATFORMTHEME = "qt6ct";
  
  };
}
