{ config, lib, ... }:
{
  options = {
    shell.tmux.enable = lib.mkEnableOption "enables tmux";
  };

  config = lib.mkIf config.shell.tmux.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      aggressiveResize = true;
    };

    xdg.configFile."tmux/tmux.conf".source = ./conf/tmux.conf;

    home.file.".local/scripts/tmux-sessionizer" = {
      executable = true;
      source = ../scripts/tmux-sessionizer;
    };
  };
}
