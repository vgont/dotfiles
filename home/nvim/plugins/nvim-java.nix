{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      {
	plugin = nvim-java;
      }
    ];
  };
}
