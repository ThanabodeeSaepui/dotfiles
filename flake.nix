{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Track the cached branch; do not add `inputs.nixpkgs.follows`, or store
    # paths stop matching umbriel.cachix.org.
    umbriel.url = "github:noctalia-dev/umbriel/cachix";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    omp.url = "github:can1357/oh-my-pi";
  };

  outputs =
    {
      self,
      nixpkgs,
      nur,
      home-manager,
      ...
    }@inputs:
    let
      # system = builtins.currentSystem;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          ./home
        ];
      };
    };
}
