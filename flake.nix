{
    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";
        home-manager.url = "github:nix-community/home-manager";
        nixpkgs.url = "nixpkgs/nixos-24.11";
    };

    outputs = {flake-parts, ...} @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            imports = [
                inputs.home-manager.flakeModules.default
            ];

            homeModules = {
                xmonad = ./xmonad.nix;
            };

            nixosModules = {
                xmonad = ./configuration.nix;
            };
        };
}