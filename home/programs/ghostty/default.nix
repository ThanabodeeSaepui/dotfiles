{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      command = "zsh";
      shell-integration = "zsh";
    };
  };
}
