{...}: {
  programs.nixvim = {
    diagnostic.settings = {
      virtual_text = false;
      signs = false;
    };

    plugins = {
      tiny-inline-diagnostic = {
        enable = true;

        settings = {
          multilines = {
            enabled = true;
          };
          options = {
            use_icons_from_diagnostic = false;
          };
        };
      };
    };
  };
}
