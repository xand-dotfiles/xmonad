let
    nixosModules = {
        xmonad = ./configuration.nix;
    };
in
{
    flake = {
        inherit nixosModules;
    };
}