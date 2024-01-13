{ config, lib, pkgs, ... }:

let
  inherit (lib) mkForce;
  system_type = config.mobile.system.type;

  defaultUserName = "gao";
in
{
  imports = [
    ./phosh.nix
  ];

  config = {
    users.users."${defaultUserName}" = {
      isNormalUser = true;
      password = "2580";
      extraGroups = [
        "dialout"
        "feedbackd"
        "networkmanager"
        "video"
        "wheel"
      ];
    };
    
    services.xserver.desktopManager.phosh = {
      user = defaultUserName;
    };

    services.openssh.enable = true;
  };
}
