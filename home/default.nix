{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./text-editors
    ./shell
    ./window-manager
  ];
}
