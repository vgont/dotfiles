{
  config,
  lib,
  pkgs,
  ...
}: let
  theme = "gruvbox";

  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";

  pluginFiles =
    builtins.filter (file: lib.hasSuffix ".nix" file)
    (builtins.attrNames (builtins.readDir ./plugins));
  pluginModules = map (file:
    import (./plugins + "/${file}") {
      inherit lib;
      inherit toLuaFile;
      inherit pkgs;
    })
  pluginFiles;
  mergedPlugins = lib.mkMerge (map (plugin: plugin.programs.nixvim) pluginModules);
in {
  options = {
    text-editors.nixvim.enable = lib.mkEnableOption "nixvim";
  };

  config = lib.mkIf config.text-editors.nixvim.enable {
    stylix.targets.nixvim.enable = false;
    programs.nixvim = lib.mkMerge [
      {
        enable = true;

        plugins = {
          treesitter = {
            enable = true;
            settings.indent.enable = true;

            settings.incremental_selection = {
              enable = true;
              keymaps = {
                init_selection = "<CR>";
                node_incremental = "<CR>";
                scope_incremental = false;
                node_decremental = "<BS>";
              };
            };
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

        diagnostic.settings = {
          float = {border = "rounded";};
        };

        extraConfigLua = builtins.readFile ./extraConfig.lua;

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
  };
}
