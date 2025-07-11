{
  config,
  lib,
  ...
}: {
  options = {
    shell.terminals.ghostty.enable = lib.mkEnableOption "enables ghostty";
  };

  config = lib.mkIf config.shell.terminals.ghostty.enable {
    stylix.targets.ghostty.enable = false;
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "GruvboxDark";
        font-size = 16;
        background-opacity = 0.8;
        background-blur = true;
      };
    };
  };
}
