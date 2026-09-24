{
  programs.niri = {
    enable = true;
    # Use the GTK portal directly; Nautilus pulls in gnome-user-share/Apache
    # and is not otherwise used on this Niri setup.
    useNautilus = false;
  };
}
