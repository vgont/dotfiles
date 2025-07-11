{
  pkgs,
  toLuaFile,
  ...
}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = vim-dotenv;
      }
    ];
  };
}
