{ pkgs, toLuaFile, ... }: {
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
	ai = { };

	icons = { };

        notify = { };

	surround = { };

	operators = { };

	animate = { };

	indentscope = { };

	diff = { };

	bracketed = { };

	jump = { };

	statusline = { };

	pick = { };

	splitjoin = { };

	pairs = {
	  disable_in_visualblock = true;
	  disable_in_insert = true;
	  disable_in_replace = true;
	};

	move = {
	  mappings = {
	    left = "<M-left>";
	    right = "<M-right>";
	    down = "<M-down>";
	    up = "<M-up>";
	    line_left = "<M-left>";
	    line_right = "<M-right>";
	    line_down = "<M-down>";
	    line_up = "<M-up>";
	  };
	};

      };
    };
  };
}

