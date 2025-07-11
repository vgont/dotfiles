{pkgs, ...}: {
  home.packages = with pkgs; [
    typescript
    nodejs
    tree-sitter-grammars.tree-sitter-typescript

    #pkg managers
    yarn

    #linters
    eslint

    #lsp
    typescript-language-server
    vscode-langservers-extracted
  ];
}
