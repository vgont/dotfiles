{ ... }: {
  programs.nixvim = {
    plugins.telescope.enable = true;
    keymaps = [
      {
	action = "<cmd>Telescope fd<CR>";
	key = "<leader>f";
      }
    ];
  };
}
