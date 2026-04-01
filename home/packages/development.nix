{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Bun JavaScript runtime and package manager
    bun
    rustup
    uv

    devenv

    # LSP
    pyright # python
    typescript-language-server  # typescript
    nil # nix
  ];
}