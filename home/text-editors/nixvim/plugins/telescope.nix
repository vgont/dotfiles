{ ... }: {
  programs.nixvim = {
    plugins.telescope.enable = true;
    keymaps = [
      {
	action = "<cmd>Telescope fd<CR>";
	key = "<leader>f";
      }
      {
	action = "<cmd>Telescope buffers<CR>";
	key = "<leader>b";
      }
    ];
  };
}
