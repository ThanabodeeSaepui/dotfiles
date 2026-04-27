{ config, pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      git = {
        pagers = [
          {
            colorArg = "always";
            pager = "${pkgs.delta}/bin/delta --dark --paging=never";
          }
        ];
      };
    };
  };
}