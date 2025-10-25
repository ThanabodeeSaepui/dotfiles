{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Bun JavaScript runtime and package manager
    bun
  ];
}