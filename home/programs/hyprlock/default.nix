{
  programs.hyprlock = {
    enable = true;
    
    settings = {
      # Background configuration
      # background = [
      #   {
      #     monitor = "";
      #     path = "~/Pictures/wallpapers/walls/rocky-beach-gloomy.png";
      #     blur_passes = 1;
      #     brightness = 0.5;
      #   }
      # ];
      
      # General settings
      general = {
        ignore_empty_input = true;
      };
      
      # Input field configuration
      input-field = [
        {
          monitor = "";
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.4; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(ffffffff)"; # full white
          inner_color = "rgba(ffffff40)"; # faded white
          font_color = "rgba(ffffffff)"; # full white
          check_color = "rgba(ff0000ff)"; # solid red
          font_family = "JetBrainsMono NerdFont";
          placeholder_text = "input password...";
          fade_on_empty = false;
          rounding = -1;
          hide_input = false;
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];
      
      # Profile picture
      image = [
        {
          monitor = "";
          # path = "~/Pictures/mh.jpg";
          size = 200;
          border_size = 2;
          border_color = "rgba(ffffffff)";
          position = "0, 60";
          halign = "center";
          valign = "center";
        }
      ];
      
      # Labels for date, time, and welcome message
      label = [
        # Date label
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "rgb(cdd6f4)";
          font_size = 22;
          font_family = "JetBrainsMono NerdFont";
          position = "-105, 65";
          halign = "right";
          valign = "bottom";
        }
        # Time label
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%-H:%M")"'';
          color = "rgb(cdd6f4)";
          font_size = 95;
          font_family = "JetBrainsMono NerdFont";
          position = "-100, 70";
          halign = "right";
          valign = "bottom";
        }
        # Welcome message label
        {
          monitor = "";
          text = ''cmd[update:1000] echo "welcome back, $(whoami)"'';
          color = "rgb(cdd6f4)";
          font_size = 14;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, -170";
          halign = "center";
          valign = "center";
        }
        # Commented battery label (uncomment if needed)
        # {
        #   monitor = "";
        #   text = ''cmd[update:3000] $HOME/.config/hypr/scripts/battery.sh'';
        #   text_align = "center";
        #   color = "rgb(a6e3a1)";
        #   font_size = 22;
        #   font_family = "JetBrainsMono NerdFont";
        #   rotate = 0;
        #   position = "100, 65";
        #   halign = "left";
        #   valign = "bottom";
        # }
      ];
    };
  };
}