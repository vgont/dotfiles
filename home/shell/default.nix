{ ... }:
{
  imports = [
    ./terminals
    ./languages
    ./databases
    ./tmux
    ./fish
    ./common.nix
  ];

  home.sessionVariables = { 
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "ghostty";
  };
}
