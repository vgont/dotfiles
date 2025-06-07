{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nvim
    ./shell
    ./window-manager
  ];

  home.username = "vgont";
  home.homeDirectory = "/home/vgont";

  home.activation.createWorkDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/work" ]; then
      mkdir -p "$HOME/work"
    fi
    if [ ! -d "$HOME/personal-projects" ]; then
      mkdir -p "$HOME/personal-projects"
    fi
  '';

  home.packages = with pkgs; [
    neofetch
    vesktop

    # archives
    zip
    unzip

    # utils
    ripgrep
    eza
    jq
    fzf
    zoxide

    #wl
    rofi
    wl-clipboard

    # fish
    fishPlugins.hydro
  ];

  programs.git = {
    enable = true;
    userName = "vgont";
    userEmail = "vgontdev@gmail.com";
  };

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
  };

  programs.brave = {
    enable = true;
  };

  home.stateVersion = "25.05";
}
