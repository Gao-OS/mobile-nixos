#
# This file represents safe opinionated defaults for a basic Phosh system.
#
# NOTE: this file and any it imports **have** to be safe to import from
#       an end-user's config.
#
{ config, lib, pkgs, options, ... }:

{
  mobile.beautification = {
    silentBoot = lib.mkDefault true;
    splash = lib.mkDefault true;
  };

  mobile.adbd.enable = true;

  services.xserver.desktopManager.phosh = {
    user = "gao";
    enable = true;
    group = "users";
  };

  programs.calls.enable = true;

  environment.systemPackages = with pkgs; [
    chatty              # IM and SMS
    megapixels          # Camera
    phosh-mobile-settings
    openssh
    docker
    zsh
    busybox
    vim
    neovim
    wget
    curl
    git
    silver-searcher
    aria
    wqy_zenhei
    wqy_microhei
    bun
    erlang
    elixir
    python3Full
    awscli2
    jq
    lrzsz
    # GUI
    firefox
    gnome-console       # Terminal
    gnome-photos
    gnome.cheese
    gnome.gnome-calculator
    gnome.gnome-clocks
    gnome.gnome-calendar
    gnome.gnome-contacts
    gnome.gnome-weather
    gnome.gnome-keyring
    gnome.gnome-logs
    gnome.gnome-notes
    gnome.gnome-music
    gnome.gnome-nettool
    gnome.gnome-maps
    gnome.gnome-software
    gnome.gnome-power-manager
    gnome.gpaste
    gnome.networkmanager-openvpn
    gnome.networkmanager-fortisslvpn
    gnome.nautilus
    gnome.gnome-bluetooth
  ];

  hardware.sensor.iio.enable = true;

  assertions = [
    { assertion = options.services.xserver.desktopManager.phosh.user.isDefined;
    message = ''
      `services.xserver.desktopManager.phosh.user` not set.
        When importing the phosh configuration in your system, you need to set `services.xserver.desktopManager.phosh.user` to the username of the session user.
    '';
    }
  ];
}
