{
  services.hypridle = {
    enable = true;
    
    settings = {
      general = {
        # Avoid starting multiple hypridle instances
        lock_cmd = "pidof hyprlock || hyprlock";
        
        # Lock before suspend (uwsm compatible)
        before_sleep_cmd = "hyprlock";
        
        # Turn display back on after suspend  
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      
      listener = [
        # Screen lock after 5 minutes
        {
          timeout = 300; # 5 minutes
          on-timeout = "hyprlock";
        }
        
        # Turn off display after 10 minutes
        {
          timeout = 600; # 10 minutes  
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        
        # Suspend system after 30 minutes (uwsm managed)
        {
          timeout = 1800; # 30 minutes
          on-timeout = "uwsm stop";
        }
      ];
    };
  };
}