{ ... }: {
  programs.nixvim = {
    diagnostic.settings = { virtual_text = false; };

    plugins.tiny-inline-diagnostic = {
      enable = true;

      autoLoad = true;

      settings = {
	multilines = {
	  enabled = true;
	};
	options = {
	  use_icons_from_diagnostic = true;
	};
	preset = "classic";
	virt_texts = {
	  priority = 2048;
	};
      };
    };
  };
}
