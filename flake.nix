{
  description = "My NixOS system";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url =  "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url =  "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url =  "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations."maria" = nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs; };
	modules = [
	  ./hosts/maria/nixos/configuration.nix
	  home-manager.nixosModules.home-manager
	  inputs.stylix.nixosModules.stylix
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.extraSpecialArgs = { inherit inputs; inherit system; };
	    home-manager.users.vgont = import ./hosts/maria/home;
	  }
	];
      };
    };
}
