{ config, lib, pkgs, ... }:
let
  hydroConfig = builtins.readFile ./fish-plugins/hydro.fish;
in
{
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

      shellAliases = {
	ls = "eza --icons";
	ll = "eza --icons -l";
	cat = "bat";
	cd = "z";
	tree = "eza --icons --tree";
	dd = "cd ~/dotfiles";
	ww = "cd ~/work";
	pp = "cd ~/personal-projects/";
	snorf = "sudo nixos-rebuild switch --flake ~/dotfiles/";
	ts = "tmux-sessionizer";
	t = "tmux";
      };

      functions = {
	sourcenv = builtins.readFile ./functions/sourcenv.fish;
      };
    };
  };
}
