{ lib, ... }:

{
  programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;

      settings = {
	completion = {
	  list = {
	    max_items = 10;
	    selection = {
	      auto_insert = true;
	    };
	  };
	  documentation = {
	    auto_show = true;
	  };
	};

	appearance = {
	  use_nvim_cmp_as_default = true;
	  nerd_font_variant = "mono";
	};

	keymap = {
	  "<C-j>" = [ "select_next" "fallback" ];
	  "<C-k>" = [ "select_prev" "fallback" ];
	  "<C-c>" = [ "hide_documentation" "fallback" ];
	  "<C-a>" = [ "select_and_accept" "fallback" ];
	};
      };
    };
  };
}

