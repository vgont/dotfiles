{pkgs, ...}: {
  programs.java.enable = true;

  home.packages = with pkgs; [
    maven
    gradle
  ];
}
