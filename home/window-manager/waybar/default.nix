{
  config,
  lib,
  ...
}: {
  options = {
    window-manager.waybar.enable = lib.mkEnableOption "enables waybar";
  };

  config = lib.mkIf config.window-manager.waybar.enable {
    programs.waybar = {
      enable = true;
      style = builtins.readFile ./style.css;
      settings = {
        mainBar = {
          name = "main";

          reload_style_on_change = true;

          modules-left = ["tray" "clock" "niri/language" "backlight/slider"];
          modules-center = ["niri/workspaces"];
          modules-right = ["group/expand" "network" "battery"];

          "niri/workspaces" = {
            format = "{icon}";
            format-icons = {
              active = "";
              default = "";
              empty = "";
            };
          };

          "clock" = {
            interval = 1;
            timezone = "America/Sao_Paulo";
            format = "{:%I:%M:%S %p} ";
            tooltip-format = "<tt>{calendar}</tt>";
            calendar = {
              format = {
                today = "<span color='#fAfBfC'><b>{}</b></span>";
              };
            };
            actions = {
              on-click-right = "shift_down";
              on-click = "shift_up";
            };
          };

          "tray" = {
            icon-size = 21;
            spacing = 10;
          };

          "battery" = {
            interval = 30;
            states = {
              good = 95;
              warning = 30;
              critical = 20;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰂄";
            format-plugged = "{capacity}% 󰂄 ";
            format-alt = "{time} {icon}";
            format-icons = [
              "󰁻"
              "󰁼"
              "󰁾"
              "󰂀"
              "󰂂"
              "󰁹"
            ];
          };

          "network" = {
            format-wifi = "";
            tooltip-format-wifi = "{essid} ({signalStrength}%) ";
            on-click = "ghostty -e nmtui";
          };

          "niri/language" = {
            format = "{short}";
          };

          "custom/expand" = {
            format = "";
            tooltip = false;
          };
          "custom/endpoint" = {
            format = "|";
            tooltip = false;
          };
          "group/expand" = {
            orientation = "horizontal";
            drawer = {
              "transition-duration" = 600;
              "transition-to-left" = true;
              "click-to-reveal" = true;
            };
            modules = ["custom/expand" "backlight" "cpu" "memory" "temperature" "custom/endpoint"];
          };

          "cpu" = {
            format = "󰻠";
            tooltip = true;
          };
          "memory" = {
            format = "";
          };
          "temperature" = {
            critical-threshold = 80;
            format = "";
          };

          "backlight" = {
            device = "intel_backlight";
            format = "{percent}% {icon}";
            format-icons = ["" ""];
          };

          "backlight/slider" = {
            min = 0;
            max = 100;
            orientation = "horizontal";
            device = "intel_backlight";
          };
        };
      };
    };
  };
}
