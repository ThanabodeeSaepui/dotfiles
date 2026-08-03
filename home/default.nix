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
    inputs.nur.modules.nixos.default
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.backupFileExtension = "backup";

  services.flatpak.enable = true;

  home-manager.users.safe = {
    imports = [
      ./packages
      ./programs
      inputs.nix-flatpak.homeManagerModules.nix-flatpak
      inputs.noctalia.homeModules.default
      inputs.niri.homeModules.niri
    ];

    home.stateVersion = "25.05";

    home = {
      username = "safe";
      homeDirectory = "/home/safe";
    };

    home.packages = with pkgs; [
      # Apps
      vlc
      signal-desktop
      thunderbird
      tor
      qbittorrent-enhanced
      mission-center
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })

      # rustdesk
      pangolin-cli

      # Screenshot
      grim
      slurp

      # Clipboard
      wl-clipboard

      # Cursor
      bibata-cursors

      # vdhcoapp
      nur.repos.charmbracelet.crush

      # claude-code
      opencode

      lsfg-vk
      lsfg-vk-ui
    ];

    programs = {
      home-manager.enable = true;
      brave.enable = true;
      librewolf.enable = true;
      obs-studio.enable = true;

      waybar.enable = true;
    };
    services = {
      network-manager-applet.enable = true;
      mako.enable = true;
      swayidle.enable = true;
      polkit-gnome.enable = true;
    };

    services.flatpak = {
      enable = true;
      update.onActivation = true;

      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      packages = [
        "com.rustdesk.RustDesk"
        "org.onlyoffice.desktopeditors"
        "org.kde.okular"
        "org.kde.dolphin"
        "org.kde.filelight"
        "com.vysp3r.ProtonPlus"
        "org.freecad.FreeCAD"
        "com.nextcloud.desktopclient.nextcloud"
      ];
    };

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "org.kde.okular.desktop";
      };
    };

    home.sessionVariables = {
      # We use lib.mkForce to resolve the conflict
      XDG_DATA_DIRS = lib.mkForce "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
      NIXOS_OZONE_WL = "1";

      # NVIDIA Wayland - needed for Niri to see/use NVIDIA GPU
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      LIBVA_DRIVER_NAME = "nvidia";
      WLR_NO_HARDWARE_CURSORS = "1";

      QT_QPA_PLATFORMTHEME= "gtk3";
    };
  };
}
