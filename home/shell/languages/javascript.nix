{ ... }:
{
  home.packages = with pkgs; [
    typescript
    nodejs
    yarn
    eslint
  ];
}
