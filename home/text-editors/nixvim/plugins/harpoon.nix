{
  pkgs,
  toLuaFile,
  ...
}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = harpoon2;
        config = toLuaFile ./lua/harpoon.lua;
      }
    ];
  };
}
