{ ... }:
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    aggressiveResize = true;
  };

  xdg.configFile."tmux/tmux.conf".source = ./conf/tmux.conf;
}
