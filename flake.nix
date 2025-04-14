{
    inputs = {
        flake-parts.url = "github:hercules-ci/flake-parts";
        hm-flake-parts.url = "git+https://git@git.computeroid.org/xand-dotfiles/hm-flake-parts-backport";
        home-manager.url = "github:nix-community/home-manager/release-24.11";
        nixpkgs.url = "nixpkgs/nixos-24.11";
    };

    outputs = {flake-parts, ...} @ inputs:
        flake-parts.lib.mkFlake { inherit inputs; } {
            imports = [
                inputs.hm-flake-parts.flakeModule
                ./home
                ./nixos
            ];
        };
}