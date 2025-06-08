{ lib, ... }:
let
  hydroConfig = builtins.readFile ./fish-plugins/hydro.fish;
in
{
  imports = [
    ./common.nix
    ./terminals.nix
    ./languages
    ./tmux
  ];

  programs.fish = {
    enable = true;
    shellInit = ''
      zoxide init fish | source
    '';
    interactiveShellInit = ''
      set fish_greeting
      set PATH $PATH ~/.local/scripts

      bind \cf tmux-sessionizer
      ${hydroConfig}
    '';

    shellAliases = {
      ls = "eza --icons";
      ll = "eza --icons -l";
      tree = "eza --icons --tree";
      dd = "cd ~/dotfiles";
      ww = "cd ~/work";
      pp = "cd ~/personal-projects/";
      snorf = "sudo nixos-rebuild switch --flake ~/dotfiles/";
      ts = "tmux-sessionizer";
    };
  };

  home.file.".local/scripts/tmux-sessionizer" = {
    executable = true;
    source = ./scripts/tmux-sessionizer;
  };

  home.sessionVariables = { 
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "ghostty";
  };
}
