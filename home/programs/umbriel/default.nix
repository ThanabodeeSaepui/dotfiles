{
  programs.umbriel = {
    enable = true;

    settings = {
      general = {
        autostart = [ "noctalia" ];
        mod_key = "Super";
        show_cheatsheet = true;
      };

      # Niri's scrolling column model maps directly onto Umbriel's scrolling
      # layout: fixed-width columns on a horizontal strip.
      layout = {
        mode = "scrolling";
        extent_presets = [
          0.333
          0.5
          0.667
        ];
        scrolling.default_extent_fraction = 0.5;
      };

      input = {
        keyboard = {
          layout = "us,th";
          options = "grp:win_space_toggle";
          numlock_toggle = true;
        };
        touchpad = {
          tap = true;
          click_method = "button_areas";
          # Traditional scrolling: content moves opposite the finger travel.
          natural_scroll = true;
        };
        cursor = {
          theme = "Bibata-Modern-Classic";
          size = 24;
        };
      };

      appearance = {
        prefer_no_csd = true;
        border_width = 2;
        corner_radius = 10;
        blur = {
          enabled = true;
          optimized = true;
          passes = 2;
          radius = 3;
          noise = 0.02;
          brightness = 0.9;
          contrast = 0.9;
          saturation = 1.1;
        };
      };

      window_rule = [
        # Blur every window over the compositor background.
        { blur = true; }

        # Noctalia's settings window and Umbriel's share picker are dialogs.
        {
          match.app_id = "^dev.noctalia.Noctalia$";
          default_floating = true;
          default_floating_size_px = {
            width = 1020;
            height = 900;
          };
        }
        {
          match.app_id = "^dev.noctalia.UmbrielSharePicker$";
          default_floating = true;
          default_floating_size_px = {
            width = 800;
            height = 600;
          };
        }
      ];

      layer_rule = [
        {
          match.namespace = "^noctalia-(bar-.*|notification|dock|panel|attached-panel|osd|desktop-widget-.*)$";
          blur = true;
          blur_ignore_alpha = 0.5;
          blur_popups = true;
        }
        {
          match.namespace = "^noctalia-(notification|dock|panel|attached-panel|osd)$";
          blur_optimized = false;
        }
      ];

      keybinds = {
        # Session and applications
        "Mod+Shift+Slash" = "cheatsheet-toggle";
        "Mod+T" = {
          action = "spawn ghostty";
          repeat = false;
        };
        "Mod+D" = {
          action = "spawn noctalia msg panel-toggle launcher";
          repeat = false;
        };
        "Super+Alt+L" = {
          action = "spawn noctalia msg session lock";
          allow_when_locked = true;
          repeat = false;
        };
        "Mod+Q" = {
          action = "window-close";
          repeat = false;
        };
        "Mod+O" = {
          action = "overview-toggle";
          repeat = false;
        };

        # Focus
        "Mod+Left" = "window-focus-left";
        "Mod+Down" = "window-focus-down";
        "Mod+Up" = "window-focus-up";
        "Mod+Right" = "window-focus-right";
        "Mod+H" = "window-focus-left";
        "Mod+J" = "window-focus-down";
        "Mod+K" = "window-focus-up";
        "Mod+L" = "window-focus-right";

        # Move columns and windows
        "Mod+Ctrl+Left" = "column-move-left";
        "Mod+Ctrl+Down" = "window-move-down";
        "Mod+Ctrl+Up" = "window-move-up";
        "Mod+Ctrl+Right" = "column-move-right";
        "Mod+Ctrl+H" = "column-move-left";
        "Mod+Ctrl+J" = "window-move-down";
        "Mod+Ctrl+K" = "window-move-up";
        "Mod+Ctrl+L" = "column-move-right";

        # First and last column
        "Mod+Home" = "column-focus-first";
        "Mod+End" = "column-focus-last";
        "Mod+Ctrl+Home" = "column-move-to-first";
        "Mod+Ctrl+End" = "column-move-to-last";

        # Output focus
        "Mod+Shift+Left" = "output-focus-left";
        "Mod+Shift+Down" = "output-focus-down";
        "Mod+Shift+Up" = "output-focus-up";
        "Mod+Shift+Right" = "output-focus-right";
        "Mod+Shift+H" = "output-focus-left";
        "Mod+Shift+J" = "output-focus-down";
        "Mod+Shift+K" = "output-focus-up";
        "Mod+Shift+L" = "output-focus-right";

        # Move columns to another output
        "Mod+Shift+Ctrl+Left" = "column-move-to-output-left";
        "Mod+Shift+Ctrl+Down" = "column-move-to-output-down";
        "Mod+Shift+Ctrl+Up" = "column-move-to-output-up";
        "Mod+Shift+Ctrl+Right" = "column-move-to-output-right";
        "Mod+Shift+Ctrl+H" = "column-move-to-output-left";
        "Mod+Shift+Ctrl+J" = "column-move-to-output-down";
        "Mod+Shift+Ctrl+K" = "column-move-to-output-up";
        "Mod+Shift+Ctrl+L" = "column-move-to-output-right";

        # Workspaces
        "Mod+Page_Down" = "workspace-next";
        "Mod+Page_Up" = "workspace-previous";
        "Mod+U" = "workspace-next";
        "Mod+I" = "workspace-previous";
        "Mod+Ctrl+Page_Down" = "column-move-to-workspace-next";
        "Mod+Ctrl+Page_Up" = "column-move-to-workspace-previous";
        "Mod+Ctrl+U" = "column-move-to-workspace-next";
        "Mod+Ctrl+I" = "column-move-to-workspace-previous";
        "Mod+Shift+Page_Down" = "workspace-move-down";
        "Mod+Shift+Page_Up" = "workspace-move-up";
        "Mod+Shift+U" = "workspace-move-down";
        "Mod+Shift+I" = "workspace-move-up";

        # Wheel navigation
        "Mod+WheelDown" = {
          action = "workspace-next";
          cooldown_ms = 150;
        };
        "Mod+WheelUp" = {
          action = "workspace-previous";
          cooldown_ms = 150;
        };
        "Mod+Ctrl+WheelDown" = {
          action = "column-move-to-workspace-next";
          cooldown_ms = 150;
        };
        "Mod+Ctrl+WheelUp" = {
          action = "column-move-to-workspace-previous";
          cooldown_ms = 150;
        };
        "Mod+WheelRight" = "window-focus-right";
        "Mod+WheelLeft" = "window-focus-left";
        "Mod+Ctrl+WheelRight" = "column-move-right";
        "Mod+Ctrl+WheelLeft" = "column-move-left";

        # Workspaces by index
        "Mod+1" = "workspace-switch 1";
        "Mod+2" = "workspace-switch 2";
        "Mod+3" = "workspace-switch 3";
        "Mod+4" = "workspace-switch 4";
        "Mod+5" = "workspace-switch 5";
        "Mod+6" = "workspace-switch 6";
        "Mod+7" = "workspace-switch 7";
        "Mod+8" = "workspace-switch 8";
        "Mod+9" = "workspace-switch 9";
        "Mod+Ctrl+1" = "column-move-to-workspace 1";
        "Mod+Ctrl+2" = "column-move-to-workspace 2";
        "Mod+Ctrl+3" = "column-move-to-workspace 3";
        "Mod+Ctrl+4" = "column-move-to-workspace 4";
        "Mod+Ctrl+5" = "column-move-to-workspace 5";
        "Mod+Ctrl+6" = "column-move-to-workspace 6";
        "Mod+Ctrl+7" = "column-move-to-workspace 7";
        "Mod+Ctrl+8" = "column-move-to-workspace 8";
        "Mod+Ctrl+9" = "column-move-to-workspace 9";

        # Column manipulation
        "Mod+BracketLeft" = "window-consume-or-expel-left";
        "Mod+BracketRight" = "window-consume-or-expel-right";
        "Mod+Comma" = "window-consume-left";
        "Mod+Period" = "window-consume-or-expel-right";

        # Width and height
        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-secondary-extent";
        "Mod+Ctrl+R" = "window-set-secondary-extent 1.0";
        "Mod+F" = {
          action = "window-toggle-maximize";
          repeat = false;
        };
        "Mod+Shift+F" = {
          action = "window-toggle-fullscreen";
          repeat = false;
        };
        "Mod+M" = {
          action = "window-toggle-maximize";
          repeat = false;
        };
        "Mod+Ctrl+F" = "window-set-primary-extent 1.0";
        "Mod+C" = "column-center";
        "Mod+Ctrl+C" = "column-center";
        "Mod+Minus" = "window-modify-primary-extent -0.1";
        "Mod+Equal" = "window-modify-primary-extent +0.1";
        "Mod+Shift+Minus" = "window-modify-secondary-extent -0.1";
        "Mod+Shift+Equal" = "window-modify-secondary-extent +0.1";

        # Floating
        "Mod+V" = {
          action = "window-toggle-floating";
          repeat = false;
        };
        "Mod+Shift+V" = {
          action = "window-focus-switch-floating";
          repeat = false;
        };

        # Tabs
        "Mod+W" = {
          action = "column-toggle-tabbed";
          repeat = false;
        };

        # Screenshots through Noctalia
        "Print" = {
          action = "spawn noctalia msg screenshot-region";
          repeat = false;
        };
        "Ctrl+Print" = {
          action = "spawn noctalia msg screenshot-fullscreen";
          repeat = false;
        };
        "Alt+Print" = {
          action = "spawn noctalia msg screenshot-window";
          repeat = false;
        };

        # Other
        "Mod+Escape" = {
          action = "shortcuts-inhibit-toggle";
          allow_when_inhibited = true;
          repeat = false;
        };
        "Mod+Shift+E" = "session-quit";
        "Ctrl+Alt+Delete" = "session-quit";
        "Mod+Shift+P" = "dpms-off";

        # Volume
        "XF86AudioRaiseVolume" = {
          action = "spawn noctalia msg volume-up";
          allow_when_locked = true;
        };
        "XF86AudioLowerVolume" = {
          action = "spawn noctalia msg volume-down";
          allow_when_locked = true;
        };
        "XF86AudioMute" = {
          action = "spawn noctalia msg volume-mute";
          allow_when_locked = true;
          repeat = false;
        };
        "XF86AudioMicMute" = {
          action = "spawn noctalia msg mic-mute";
          allow_when_locked = true;
          repeat = false;
        };

        # Media
        "XF86AudioPlay" = {
          action = "spawn noctalia msg media toggle";
          allow_when_locked = true;
          repeat = false;
        };
        "XF86AudioStop" = {
          action = "spawn noctalia msg media stop";
          allow_when_locked = true;
          repeat = false;
        };
        "XF86AudioPrev" = {
          action = "spawn noctalia msg media previous";
          allow_when_locked = true;
        };
        "XF86AudioNext" = {
          action = "spawn noctalia msg media next";
          allow_when_locked = true;
        };

        # Brightness
        "XF86MonBrightnessUp" = {
          action = "spawn noctalia msg brightness-up";
          allow_when_locked = true;
        };
        "XF86MonBrightnessDown" = {
          action = "spawn noctalia msg brightness-down";
          allow_when_locked = true;
        };
      };
    };
  };
}
