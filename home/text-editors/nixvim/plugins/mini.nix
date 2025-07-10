{ ... }: {
  programs.nixvim = {
    plugins.mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
	ai = { };

	icons = { };

	surround = { };

	operators = { };

	indentscope = { };

	diff = { };

	git = { };

	bracketed = { };

	jump = { };

	statusline = { };

	splitjoin = { };

	pairs = {
	  disable_in_visualblock = true;
	  disable_in_insert = true;
	  disable_in_replace = true;
	};

	pick = {
	  window.config = {
	    border = "rounded";
	  };
	};

	notify = {
	  window.config = {
	    border = "rounded";
	  };
	  window.winblend = 0;
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

    keymaps = [
      {
	action = ":Git commit<CR>";	
	key = "<leader>gc";
      }

      {
	action = ":Git status<CR>";	
	key = "<leader>gs";
      }	

      {
	action = "<cmd>Pick files<CR>";
	key = "<leader>pf";
      }
      
      {
	action = "<cmd>Pick grep_live<CR>";
	key = "<leader>pg";
      }

      {
	action = "<cmd>Pick buffers<CR>";
	key = "<leader>pb";
      }
    ];
  };
}

