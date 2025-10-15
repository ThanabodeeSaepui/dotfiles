{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Nix
        jnoortheen.nix-ide
        arrterian.nix-env-selector

        # Icon Theme
        pkief.material-icon-theme

        # File extension
        tamasfe.even-better-toml

        fill-labs.dependi
      ];

      userSettings = {
        "workbench.iconTheme" = "material-icon-theme";
      };
    };
  };
}
