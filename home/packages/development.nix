{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Bun JavaScript runtime and package manager
    bun

    uv

    # LSP
    pyright # python
    typescript-language-server  # typescript
    nil # nix
  ];
}