{pkgs, ...}: {
  home.packages = with pkgs; [
    fzf
    ripgrep
  ];

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "auto";
    };

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };
  };
}
