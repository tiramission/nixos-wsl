{
  description = "A very basic flake";

  inputs = {
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager.url = "github:nix-community/home-manager";
    sops-nix.url = "github:Mic92/sops-nix";

    # nixpkgs.follows = "nixos-wsl/nixpkgs";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: let
    info = builtins.fromTOML (builtins.readFile ./info.toml);
  in {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs info;};
      modules = [
        ./system/all.nix
      ];
    };
  };
}
