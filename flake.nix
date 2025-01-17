{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    wired.url = "github:Toqozz/wired-notify";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, agenix, wired, ... }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
        ]
          (system: function nixpkgs.legacyPackages.${system});

      init_system =
        { configuration
        , key
        , system ? "x86_64-linux"
        ,
        }: nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./secrets/default.nix
            ./modules/default.nix
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            configuration
          ];

          specialArgs = {
            inherit home-manager key wired;
          };
        };
    in
    {
      nixosConfigurations = {
        pc = init_system {
          configuration = ./nixos-configurations/pc/default.nix;
          key = ./secrets/identities/pc;
        };

        laptop = init_system {
          configuration = ./nixos-configurations/laptop;
          key = ./secrets/identities/laptop;
        };
      };

      devShells = forAllSystems (pkgs: import ./shell.nix { inherit pkgs; });
    };
}
