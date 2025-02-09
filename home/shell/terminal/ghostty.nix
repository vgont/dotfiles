{ ... }: {
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    installVimSyntax = true;
    settings = {
      theme = "rose-pine";
      background-opacity = 0.65;
      background-blur = true;
      cursor-style = "block";
      adjust-cursor-thickness = 50;
    };
  };
}
