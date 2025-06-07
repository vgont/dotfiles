{ lib, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
  };
  xdg.configFile."sway/config".source = lib.mkForce ./config;
}
