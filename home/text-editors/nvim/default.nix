{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    text-editors.nvim.enable = lib.mkEnableOption "nvim";
  };

  config = lib.mkIf config.text-editors.nvim.enable {
    stylix.targets.neovim.enable = false;

    xdg.configFile."nvim".source = inputs.vgontnvim;

    programs.neovim = {
      enable = true;
      vimAlias = true;
    };

    home.packages = with pkgs; [
      gcc
    ];
  };
}
