{
  config,
  lib,
  pkgs,
  ...
}: let
  wallpaper = "wall-05.png";
in {
  options = {
    window-manager.niri.enable = lib.mkEnableOption "enables niri";
  };
  config = lib.mkIf config.window-manager.niri.enable {
    home.packages = with pkgs; [
      fuzzel
      swaybg
      swaylock
      xwayland-satellite
    ];

    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = [
            "gtk"
            "wlr"
          ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };

    xdg.configFile."niri/config.kdl".text = ''
      ${builtins.readFile ./config.kdl}

      spawn-at-startup "swaybg" "-i" "${config.home.homeDirectory}/dotfiles/home/window-manager/wallpapers/${wallpaper}" "-m" "fill"
    '';
  };
}
