{
	description = "system conf"; 

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
	
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = { nixpkgs, home-manager, ... }:
		let
			system = "x86_64-linux";
		in {
		nixosConfigurations.world = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ ./nix/configuration.nix ];
	 	};
	
		homeConfigurations.sholdue = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home/home.nix ];
		};
	};
}
