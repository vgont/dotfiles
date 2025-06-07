{ ... }:
let
  font = "FiraCode Nerd Font Mono";
in
{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "GruvboxDark";
      background-opacity = 0.95;
      background-blur = true;
    };
  };
}
