{ ... }: {
  programs.nixvim = {
    plugins.oil.enable = true;
    keymaps = [
      {
        action = "<cmd>Oil<cr>";
        key = "<leader>d";
      }
    ];
  };
}
