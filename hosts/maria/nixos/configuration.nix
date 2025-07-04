{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./docker.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "uvcvideo" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";

  stylix.opacity.terminal = 1.0;
  # stylix.opacity.desktop = 0.7;
  stylix.opacity.applications = 0.9;

  networking.hostName = "maria";
  networking.networkmanager.enable = true;

  security.polkit.enable = true;
  security.rtkit.enable = true;

  time.timeZone = "America/Sao_Paulo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    jack.enable = true;

    wireplumber = {
      enable = true;
      package = pkgs.wireplumber;
    };
  };

  services.libinput.enable = true;

  programs.fish.enable = true;
  programs.sway.enable = false;
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  users.users.vgont = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAdeqgzW3tzUvAiqAR3zeP7xntu+S9XZwBbkbjy/DxrC vgontdev@gmail.com"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    pavucontrol
    swaybg
    inetutils
    lftp
  ];

  fonts = {
    packages = with pkgs; [
      nerd-fonts.lilex
      nerd-fonts.code-new-roman
      roboto-serif
      font-awesome_5
    ];
    fontconfig = {
      defaultFonts = {
	monospace = [ "Lilex Nerd Font Mono" ];
	sansSerif = [ "Lilex Nerd Font Mono" ];
	serif = [ "Lilex Nerd Font Mono" ];
      };
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
  
  # networking.firewall.enable = false;

  system.stateVersion = "25.05";

}

