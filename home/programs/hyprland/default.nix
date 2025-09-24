{
  wayland.windowManager.hyprland = {
    # enable = true;
    # set the flake package
    package = null;
    portalPackage = null;
  };

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
