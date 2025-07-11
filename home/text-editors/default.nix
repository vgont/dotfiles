{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nixvim
    ./nvim
  ];
}
