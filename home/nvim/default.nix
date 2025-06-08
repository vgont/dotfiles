{ lib, pkgs, ... }:
let
  theme = "gruvbox";

  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";

  pluginFiles = builtins.filter (file: lib.hasSuffix ".nix" file)
    (builtins.attrNames (builtins.readDir ./plugins));
  pluginModules = map (file: import (./plugins + "/${file}") {
    inherit lib;
    inherit toLuaFile;
    inherit pkgs; 
  }) pluginFiles;
  mergedPlugins = lib.mkMerge (map (plugin: plugin.programs.nixvim) pluginModules);
in {
  programs.nixvim = lib.mkMerge [
    {
      enable = true;

      plugins = { 
	treesitter = {
	  enable = true;
	  settings.indent.enable = true;
	};
      };

      colorschemes.${theme}.enable = true;

      globals.mapleader = " ";
      globals.maplocalleader = " ";

      opts = {
	  number = true;
	  relativenumber = true;
	  shiftwidth = 2;
	  clipboard = "unnamedplus";
      };

      extraConfigLua = ''
	vim.cmd [[
	  highlight Normal guibg=none
	  highlight NonText guibg=none
	  highlight Normal ctermbg=none
	  highlight NonText ctermbg=none
	]]
      '';

      keymaps = [
	{
	  action = "<C-u>zz";	
	  key = "<C-u>";
	}	
	{
	  action = "<C-d>zz";	
	  key = "<C-d>";
	}	
	{
	  action = ":bd<CR>";	
	  key = "<leader>q";
	}	
      ];
    }

    mergedPlugins
  ];
}
