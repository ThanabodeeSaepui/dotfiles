{ pkgs, ... }: {
  systemd.services.netbird = {
    description = "NetBird agent";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.netbird}/bin/netbird service run";
      Restart = "always";
      RestartSec = 3;
    };
  };

  systemd.tmpfiles.rules = [
    "d /run/netbird 0755 root root -"
  ];
}
