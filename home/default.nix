{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.safe = {
    imports = [
      ./hyprland
      ./programs
    ];

    home.stateVersion = "25.05";

    home = {
      username = "safe";
      homeDirectory = "/home/safe";
    };

    programs = {
      home-manager.enable = true;
    };
  };
}