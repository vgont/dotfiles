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
    obsidian
    bitwarden
    brave
    firefox
    vesktop

    # archives
    zip
    unzip

    # utils
    wl-clipboard
    ripgrep
    bat
    eza
    jq
    fzf
    yazi
    zoxide
    btop
    gnumake
    usbutils
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

  home.stateVersion = "25.05";
}

