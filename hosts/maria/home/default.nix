{ pkgs, lib, ... }:

{
  imports = [
    ../../../home
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
    macchina

    # apps
    bitwarden
    firefox
    vesktop

    # archives
    zip
    unzip

    # utils
    ripgrep
    bat
    eza
    jq
    fzf
    yazi
    zoxide
    btop
  ];

  text-editors.nixvim.enable = true;

  window-manager = {
    niri.enable = true;
    waybar.enable = true;
  };

  shell = {
    fish.enable = true;
    tmux.enable = true;

    terminals.ghostty.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "vgont";
    userEmail = "vgontdev@gmail.com";
  };

  programs.brave.enable = true;

  home.stateVersion = "25.05";
}

