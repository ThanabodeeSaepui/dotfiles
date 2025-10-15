{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # Force GTK to use system font settings
    gtk3.extraConfig = {
      gtk-font-name = "JetBrainsMono Nerd Font 11";
    };
    gtk4.extraConfig = {
      gtk-font-name = "JetBrainsMono Nerd Font 11";
    };
  };

  # User-level fontconfig to ensure fallback works
  home.file.".config/fontconfig/fonts.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <alias>
        <family>sans-serif</family>
        <prefer>
          <family>JetBrainsMono Nerd Font</family>
          <family>Sarabun</family>
          <family>Noto Sans Thai</family>
        </prefer>
      </alias>
      <alias>
        <family>monospace</family>
        <prefer>
          <family>JetBrainsMono Nerd Font Mono</family>
          <family>Sarabun</family>
          <family>Noto Sans Thai</family>
        </prefer>
      </alias>
    </fontconfig>
  '';
}
