{...}: {
  programs.nixvim = {
    plugins.supermaven = {
      enable = true;
      settings = {
        accept_suggestion = "<Tab>";
        accept_word = "<C-]>";
        clear_suggestion = "<>";
      };
    };
  };
}
