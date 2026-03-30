{
  programs.niri = {
    enable = true;
    # package = niri;
    settings = {
      input.keyboard.xkb = {
        layout = "us,th";
        options = "grp:win_space_toggle"; # Super+Space to switch
      };
      spawn-at-startup = [
        {
          command = [
            "noctalia-shell"
          ];
        }
      ];
    };
  };
}
