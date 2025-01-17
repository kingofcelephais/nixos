{ lib, config, ... }:

{
  options = { wlogout.enable = lib.mkEnableOption "enables wlogout"; };

  config = lib.mkIf config.wlogout.enable {
    programs.wlogout = {
      enable = true;

      layout = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "u";
        }
        {
          label = "reboots";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];

      style = # css
        ''
          @import "/home/kuranes/.cache/waybar/colors-waybar.css";

          * {
            font-family: FontAwesome, Roboto, Helvetica, sans-serif;
            transition: 20ms;
            color: @color2;
          }

          window {
            background-color: rgba(12,12,12,0.25);
          }

          button {
            font-size: 20px;
            background-color: @background;

            border-style: solid;
            border: 4px solid @color2;

            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;

          }

          button:focus,
          button:active,
          button:hover {
            color: @color1;
            border-style: solid;
            border: 4px solid @color1;
          }

          #suspend {
            background-image: image(url("/home/kuranes/nixos/home_manager_modules/desktop/icons/suspend.png"));
            margin: 10px;
          }
          #reboots {
            background-image: image(url("/home/kuranes/nixos/home_manager_modules/desktop/icons/reboot.png"));
            margin: 10px;
          }
          #shutdown {
            background-image: image(url("/home/kuranes/nixos/home_manager_modules/desktop/icons/shutdown.png"));
            margin: 10px;
          }
          #hibernate {
            background-image: image(url("/home/kuranes/nixos/home_manager_modules/desktop/icons/hibernate.png"));
            margin: 10px;
          }
          #logout {
            background-image: image(url("/home/kuranes/nixos/home_manager_modules/desktop/icons/logout.png"));
            margin: 10px;
          }
          #lock {
            background-image: image(url("/home/kuranes/nixos/home_manager_modules/desktop/icons/lock.png"));
            margin: 10px;
          }
        '';
    };
  };
}
