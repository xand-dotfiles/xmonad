let
    homeModules = {
        xmonad = ./xmonad.nix;
    };
in
{
    flake = {
        inherit homeModules;
    };
}