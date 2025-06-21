{ config, lib, ... }:
{
  options = {
    shell.terminals.ghostty.enable = lib.mkEnableOption "enables ghostty";
  };

  config = lib.mkIf config.shell.terminals.ghostty.enable {
    programs.ghostty = {
      enable = true;
      settings = {
	theme = "GruvboxDark";
	font-size = 12;
	background-opacity = 0.95;
	background-blur = true;
      };
    };
  };
}
