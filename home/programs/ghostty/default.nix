{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    installVimSyntax = true;
    settings = {
      command = "zsh";
      shell-integration = "zsh";
      term = "xterm-256color";
      # Keep Latin/programming glyphs in JetBrains Mono and use an explicit
      # Thai fallback instead of relying on whichever fontconfig fallback wins.
      font-family = [
        "JetBrainsMono Nerd Font Mono"
        "Noto Sans Thai"
        "Sarabun"
      ];
    };
  };
}
