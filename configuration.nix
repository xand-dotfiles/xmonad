{ config, pkgs, ... }:

let
    systemPackages = with pkgs; [
        xorg.xinit # X server initialization (xinit, startx)
    ];
in
{
    environment = {
        inherit systemPackages;
    };

    services.xserver = {
        enable = true;
        displayManager.startx.enable = true;
    };
}