{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.safe = {
    imports = [
      ./packages
      ./programs
    ];

    home.stateVersion = "25.05";

    home = {
      username = "safe";
      homeDirectory = "/home/safe";
    };

    home.packages = with pkgs; [
      # Apps
      signal-desktop
      discord

      # Screenshot
      grim
      slurp

      # Clipboard
      wl-clipboard

    ];

    programs = {
      home-manager.enable = true;
      brave.enable = true;
    };
    services = {
      blueman-applet.enable = true;
      network-manager-applet.enable = true;
    };
  };
}
