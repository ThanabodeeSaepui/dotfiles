{ config, pkgs, lib, ... }:

let
  bunGlobalPackages = [
    "@oh-my-pi/pi-coding-agent"
  ];
in
{
  programs.bun = {
    enable = true;
    settings = {
      # optional bunfig.toml settings, e.g.
      # install.globalDir = "${config.home.homeDirectory}/.bun/install/global";
    };
  };

  home.sessionPath = [
    "${config.home.homeDirectory}/.bun/bin"
  ];

  home.activation.bunGlobalPackages = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    export BUN_INSTALL="${config.home.homeDirectory}/.bun"
    export PATH="${config.programs.bun.package}/bin:$PATH"
    $DRY_RUN_CMD ${config.programs.bun.package}/bin/bun install -g ${lib.concatStringsSep " " bunGlobalPackages} $VERBOSE_ARG
  '';
}