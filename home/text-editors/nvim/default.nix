{ config, lib, pkgs, ... }:
{

  options = {
    text-editors.nvim.enable = lib.mkenableoption "nvim";
  };

  config = lib.mkif config.text-editors.nixvim.enable {
    stylix.targets.nvim.enable = false;
    programs.neovim = {
      enable = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
      ];
    }
  };
}
