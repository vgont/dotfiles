{ ... }: {
  programs.nixvim = {
    plugins.render-markdown = {
      enable = true;
      settings = { 
	completions.blink.enabled = true;
      };
    };
  };
}
