{
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

    programs.neovim = {
      enable = true;
    };

    home.packages = with pkgs; [
      gcc
    ];
  };
}
