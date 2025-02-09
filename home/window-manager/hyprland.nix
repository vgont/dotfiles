{ pkgs, ... }:
let 
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    waybar &
    swww init &

    sleep 1
  '';
in
  {
  wayland.windowManager.hyprland = {
    enable = true;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
  #home.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    monitor =
    [
      "DP-1, 1920x1080@144, 0x0, 1"
      "HDMI-A-1, 1600x900@60, 1920x0, 1"
    ];
    workspace = 
    [
      "1, monitor:DP-1, default:true"
    ];
    windowrulev2 = 
    [
      "float, class:ghostty, title:ghostty, opacity .0.8"
    ];
    bind = 
    [
      "$mod, F, exec, brave"
      "$mod, T, exec, ghostty"
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, H, movefocus, left"
      "$mod, J, movefocus, down"
      "$mod, K, movefocus, up"
      "$mod, L, movefocus, right"
    ];
  };
}
