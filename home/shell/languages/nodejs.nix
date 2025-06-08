{ ... }:
{
  home.packages = with pkgs; [
    typescript
    nodejs

    #pkg managers
    yarn

    #linters
    eslint
  ];
}
