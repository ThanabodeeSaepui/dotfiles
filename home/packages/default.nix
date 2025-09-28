{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    btop
    fzf
    zoxide
  ];
}
