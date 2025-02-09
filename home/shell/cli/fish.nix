{...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit= ''
      set fish_greeting 
      bind \cg accept-autosuggestion
    '';
  };
}
