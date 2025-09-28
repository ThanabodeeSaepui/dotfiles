{ pkgs, ... }:
{
  services.displayManager = {
    defaultSession = "hyprland-uwsm";
    sddm = {
      enable = true;
      enableHidpi = true;
      wayland.enable = true;

      sugarCandyNix = {
        enable = true;
      };
    };
  };
}
