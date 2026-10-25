# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./features-module.nix
      ./firewall-module.nix
      ./ssh-module.nix
      ./variables-module.nix
      ./software-module.nix
      ./virtualization-module.nix
      ./game-module.nix
      ./themes-module.nix
      ./system-optimization.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Nivox"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Exclude certain Xorg packages.
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  # Enable the Ly Login Manager 
  services.displayManager.ly.enable = true;
  
  # Enable the XFCE Desktop Environment.
  services.xserver.desktopManager.xfce.enable = true;

  # Exclude certain XFCE packages.
  environment.xfce.excludePackages = with pkgs; [
    mousepad
    parole
    ristretto
    xfce4-screenshooter
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Graphical Manager for printing devices.
  programs.system-config-printer.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # Enable Bluetooth.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."nivolra" = {
    isNormalUser = true;
    description = "Nivolra";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "gamemode" ];
    packages = with pkgs; [

      # Bluetooth Device Management
      blueman
    
      # Terminal Apps
      starship
      fastfetch
      htop
      cava
      fortune

      # XFCE Apps
      xfce4-whiskermenu-plugin
      xfce4-clipman-plugin
      libnotify

      # Plasma Apps
      qt6Packages.qt6ct # Theming for QT6 Apps
      libsForQt5.qt5ct # Theming for QT5 Apps

      # GNOME Apps 
      gnome-disk-utility
      gnome-firmware
      gnome-screenshot
      gnome-calendar
      gnome-calculator
      baobab # Disk Usage Analyzer
      eog # Image Viewer
      papers # PDF Viewer and Editor

      # Archive Operations
      file-roller

      # Communication
      element-desktop
      
      # Media Operations
      vlc
      libdvdcss # DVD Decryption
      filezilla
 
      # Office
      libreoffice-still
      hunspell
      hunspellDicts.de_DE
      hunspellDicts.en_US
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install thunderbird.
  programs.thunderbird.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # Terminal apps
    vim # The Nano editor is also installed by default.
    git
    curl
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable Firmware Updater.
  services.fwupd.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
