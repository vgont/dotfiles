{ pkgs, ... }: {
	imports = [
		(import ./hyprland.nix {inherit pkgs;})
	];
}
