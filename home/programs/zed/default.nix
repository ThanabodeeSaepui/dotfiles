{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "material-icon-theme"
      "nix"
    ];

    userSettings = {
        "workbench.iconTheme" = "material-icon-theme";
        "terminal.integrated.defaultProfile.linux" = "zsh (login)";
        "terminal.integrated.profiles.linux" = {
          "zsh (login)" = {
            path = "zsh";
            args = [ "-l" ];
          };
        };
      };
  };
}
