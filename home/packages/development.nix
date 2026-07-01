{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Bun JavaScript runtime and package manager
    rustup
    uv

    devenv

    # LSP
    pyright # python
    typescript-language-server  # typescript
    nil # nix
  ];
}