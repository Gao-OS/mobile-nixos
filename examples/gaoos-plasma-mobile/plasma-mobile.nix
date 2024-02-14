#
# Minimum config used to enable Plasma Mobile.
#
{ config, lib, pkgs, ... }:

{
  mobile.beautification = {
    silentBoot = lib.mkDefault false;
    splash = lib.mkDefault false;
  };

  mobile.adbd.enable = true;

  services.xserver = {
    enable = true;

    desktopManager.plasma5.mobile = {
      enable = true;
      installRecommendedSoftware = true;
    };

    displayManager.autoLogin = {
      enable = true;
    };

    displayManager.defaultSession = "plasma-mobile";

    displayManager.lightdm = {
      enable = true;
      # Workaround for autologin only working at first launch.
      # A logout or session crashing will show the login screen otherwise.
      extraSeatDefaults = ''
        session-cleanup-script=${pkgs.procps}/bin/pkill -P1 -fx ${pkgs.lightdm}/sbin/lightdm
      '';
    };

    libinput.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.pulseaudio.enable = lib.mkDefault true; # mkDefault to help out users wanting pipewire
  networking.networkmanager.enable = true;
  networking.wireless.enable = false;
  powerManagement.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    openssh
    zsh
    vim
    neovim
    wget
    curl
    git
    silver-searcher
    aria
    wqy_zenhei
    wqy_microhei
    awscli2
    jq
    lrzsz
    btop
    htop
    iftop
    cpufetch
    # GUI
    firefox
    alacritty
    thunderbird
    # Plasma Mobile
    libsForQt5.plasma-dialer
    libsForQt5.plasma-phonebook
    libsForQt5.plasma-settings
    # libsForQt5.arianna
    # libsForQt5.tokodon
    libsForQt5.calindori
    libsForQt5.kclock
    libsForQt5.angelfish
    # libsForQt5.qmlkonsole
    libsForQt5.krecorder
    libsForQt5.spacebar
    libsForQt5.kweather
    libsForQt5.keysmith
    libsForQt5.plasma-mobile
  ];

}
