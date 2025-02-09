{ ... }: 
{
  programs.nvf = {
    enable = true;
    settings = {

      vim = {
        viAlias = true;
        vimAlias = true;

        
    extraConfig = ''
      set number
      set tabstop=2
      set shiftwidth=2
    '';
        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
        };
      };
    };
  };
}
