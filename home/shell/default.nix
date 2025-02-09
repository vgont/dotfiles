{config, ...}:
let
  shellAliases = import ./shellAliases.nix;
in {
  imports = [
    ./terminal
    ./cli
  ];

  home.shellAliases = shellAliases;
}
