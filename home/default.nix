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

      # Screenshot
      grim
      slurp

      # Clipboard
      wl-clipboard

      # Cursor
      bibata-cursors

      # vdhcoapp
      nur.repos.charmbracelet.crush
    ];

    programs = {
      home-manager.enable = true;
      brave.enable = true;
      librewolf.enable = true;
      obs-studio.enable = true;
    };
    services = {
      blueman-applet.enable = true;
      network-manager-applet.enable = true;
    };

    services.flatpak = {
      enable = true;
      update.onActivation = true;
      # ADD THIS LINE:
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      packages = [
        "com.rustdesk.RustDesk"
      ];
    };

    home.sessionVariables = {
      # We use lib.mkForce to resolve the conflict
      XDG_DATA_DIRS = lib.mkForce "$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    };
  };
}
