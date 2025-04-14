{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        xorg.xinit # X server initialization (xinit, startx)
    ];

    services.xserver = {
        enable = true;
        displayManager.startx.enable = true;
    };
}