{lib, ...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      username = {
        show_always = true;
        format = "[:$user](yellow)";
      };

      directory = {
        style = "fg:255 bold";
      };

      character = {
        error_symbol = "[λ](bold red)";
        success_symbol = "[λ](bold fg:37)";
      };

      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        style = "bold green";
        truncation_length = 4;
        truncation_symbol = "";
      };

      format = lib.concatStrings [
        "$username "
        "$directory"
        "$character"
        "$git_branch"
      ];

    };
  };
} 
