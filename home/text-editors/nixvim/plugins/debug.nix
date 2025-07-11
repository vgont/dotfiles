{...}: {
  programs.nixvim = {
    plugins = {
      dap.enable = true;
      dap-ui.enable = true;
      neotest.enable = true;
    };
  };
}
