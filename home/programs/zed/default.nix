{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "material-icon-theme"
      "nix"
    ];

    userSettings = {
      "workbench.iconTheme" = "material-icon-theme";
      terminal = {
        shell = {
          with_arguments = {
            program = "zsh";
            args = [ "-l" ];
          };
        };
        font_family = "JetBrainsMono Nerd Font Mono";
        font_fallbacks = [
          "Noto Sans Thai"
          "Sarabun"
        ];
      };
    };
  };
}
