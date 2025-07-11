{...}: {
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        ts_ls.enable = true;
        eslint.enable = true;

        nil_ls.enable = true;

        terraformls.enable = true;

        gopls.enable = true;

        phpactor.enable = true;

        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = true;
        };

        omnisharp = {
          enable = true;
        };

        jdtls = {
          enable = true;
          extraOptions = {
            init_options = {
              jvm_args = [
                "-javaagent:/home/vgont/.local/share/nvim/mason/share/lombok-nightly/lombok.jar"
                "-Xbootclasspath/a:/home/vgont/.local/share/nvim/mason/share/lombok-nightly/lombok.jar"
              ];
            };
          };
        };

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
          "<leader>f" = "format";
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
