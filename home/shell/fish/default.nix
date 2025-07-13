{
  config,
  lib,
  pkgs,
  ...
}: let
  hydroConfig = builtins.readFile ./fish-plugins/hydro.fish;
  aliases = import ../aliases.nix;
in {
  options = {
    shell.fish.enable = lib.mkEnableOption "enables fish";
  };
  config = lib.mkIf config.shell.fish.enable {
    stylix.targets.fish.enable = false;
    home.packages = with pkgs; [
      fishPlugins.hydro
    ];

    programs.fish = {
      enable = true;
      shellInit = ''
        zoxide init fish | source
      '';
      interactiveShellInit = ''
        set fish_greeting
        set PATH $PATH ~/.local/scripts

        bind \cq tmux-sessionizer

        ${hydroConfig}
      '';

      shellAliases = aliases;

      functions = {
        sourcenv = builtins.readFile ./functions/sourcenv.fish;
      };
    };
  };
}
