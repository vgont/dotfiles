{ ... }: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        ts_ls.enable = true;

	jdtls.enable = true;

	nil_ls.enable = true;

        lua_ls = {
          enable = true;
          settings.telemetry.enable = true;
        };
      };

      keymaps = {
	lspBuf = {
	  K = "hover";
	  gD = "references";
	  "<leader>ca" = "code_action";
	  gd = "definition";
	  gi = "implementation";
	  gt = "type_definition";  
	};

	diagnostic = {
	  "<leader>j" = "goto_next";
	  "<leader>k" = "goto_prev";
	};
      };
    };
  };
}
