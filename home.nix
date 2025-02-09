{ config, pkgs, ... }:
let
  username = "vgont";
  args = { inherit pkgs username; };
in

{
  imports = [
    (import ./home/core.nix args)
    ./home/shell
    (import ./home/window-manager args)
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "24.11"; 

  programs.home-manager.enable = true;

  programs.vim = {
    enable = false;
  };

  programs.git = {
    enable = true;
    userName = username;
    userEmail = "vgontdev@gmail.com";
  };

  programs.brave.enable = true;
}
