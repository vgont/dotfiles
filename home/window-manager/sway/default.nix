{
  config,
  lib,
  ...
}: {
  options = {
    sway.enable = lib.mkEnableOption "enables sway";
  };

  config = lib.mkIf config.sway.enable {
    wayland.windowManager.sway.enable = true;
    xdg.configFile."sway/config".source = lib.mkForce ./config;
  };
}
