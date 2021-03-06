{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, darwin, neovim-nightly-overlay }:
    let
      overlays = [ neovim-nightly-overlay.overlay ];
    in
    {
      nixosConfigurations.home = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        inputs = { inherit overlays; };
        modules = [
          ./nix/nixos/configuration.nix
          ./nix/nixos/hardware-configuration.nix
        ];

      };

      darwinConfigurations."Jareds-MacBook-Pro" = darwin.lib.darwinSystem {
        inputs = { inherit darwin nixpkgs; };
        modules = [
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = overlays;
          })
          ./nix/darwin/configuration.nix
        ];
      };
    };
}
