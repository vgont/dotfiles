{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
  ];

  users.extraGroups.docker.members = [ "vgont" ];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
}
