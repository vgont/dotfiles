{...}: {
  programs.nixvim = {
    plugins.oil = {
      enable = true;
      settings = {
        view_options.show_hidden = true;
      };
    };

    keymaps = [
      {
        action = "<cmd>Oil<cr>";
        key = "<leader>d";
      }
    ];
  };
}
