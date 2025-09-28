{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      * {
        font-family: "Jetbrains Mono NerdFont Propo";
      }

      #waybar {
        /* background: #171717; */
        background: #0a0a0a;
        color: #fff;
      }

      #clock {
        color: #fff;
      }

      #tray {
        padding-left: 4px;
      }

      #workspaces button:hover {
        background-color: transparent;
      }

      #workspaces button {
        color: #737373;
        padding-left: 4px;
        padding-right: 4px;
        border-radius: 0px;
      }

      #workspaces button:hover {
        background-color: #262626;
      }

      #workspaces button.active {
        color: #84cc16;
      }

      #window {
        color: #fff;
      }

      #network {
        color: #3b82f6;
        margin-right: 8px;
      }

      #pulseaudio {
        color: #14b8a6;
        margin-right: 4px;
      }

      #cpu {
        color: #0ea5e9;
        margin-right: 4px;
      }

      #temperature {
        color: #eab308;
        margin-right: 4px;
      }

      #memory {
        color: #d946ef;
        margin-right: 4px;
      }

      #custom-powermenu {
        color: #f43f5e;
      }
    '';
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "margin-bottom" = 0;
        modules-left = [
          "clock"
          "custom/separator"
          "hyprland/workspaces"
          "custom/separator"
          "tray"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "temperature"
          "memory"
          "cpu"
          "pulseaudio"
          "battery"
          "network"
          "custom/separator"
          "custom/powermenu"
        ];
        "tray" = {
          "icon-size" = 16;
          "spacing" = 8;
        };
        "clock" = {
          # "interval" = 1;
          # "format" = "{:%I:%M %p  %A %b %d}";
          # "tooltip" = true;
          # "tooltip-format" = "{=%A; %d %B %Y}\n<tt>{calendar}</tt>";
          "format" = " 󰸗 {:%I:%M %p} ";
          "interval" = 60;
          "tooltip" = true;
          "tooltip-format" = "{:%d %B %H:%M}";
        };
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "separate-outputs" = false;
          "active-only" = false;
          # turn on true to show same all workspaces on each monitor
          "all-outputs" = false;
          "format-icons" = {
            # 1-10
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
            # 11-10
            "11" = "1";
            "12" = "2";
            "13" = "3";
            "14" = "4";
            "15" = "5";
            "16" = "6";
            "17" = "7";
            "18" = "8";
            "19" = "9";
            "110" = "10";
          };
        };
        "hyprland/window" = {
          "format" = "{}";
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
        };
        "mpd" = {
          "max-length" = 25;
          "format" = "<span foreground='#bb9af7'></span> {title}";
          "format-paused" = " {title}";
          "format-stopped" = "<span foreground='#bb9af7'></span>";
          "format-disconnected" = "";
          "on-click" = "mpc --quiet toggle";
          "on-click-right" = "mpc update; mpc ls | mpc add";
          "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
          "on-scroll-up" = "mpc --quiet prev";
          "on-scroll-down" = "mpc --quiet next";
          "smooth-scrolling-threshold" = 5;
          "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
        };
        "network" = {
          "format-disconnected" = "󰯡 Disconnected";
          "format-ethernet" = "󰒢 Connected!";
          "format-linked" = "󰖪 {essid} (No IP)";
          "format-wifi" = "󰖩 {essid}";
          "interval" = 1;
          "tooltip" = false;
        };

        "battery" = {
          "format" = "{capacity}% {icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "custom/powermenu" = {
          "format" = "  ";
          "tooltip" = false;
          "on-click" = "exec wlogout -p layer-shell";
        };
      }
    ];
  };
}
