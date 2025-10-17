{ pkgs, ... }:
{
  imports = [
    ./fzf.nix
    ./zoxide.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    bat
    btop

    pamixer # Pulseaudio command line mixer
  ];
}
