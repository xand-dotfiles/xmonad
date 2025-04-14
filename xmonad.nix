{ config, pkgs, ... }:

let
    xmonad = {
        config = ./xmonad.hs;
        enable = true;
        extraPackages = haskellPackages: [
            haskellPackages.containers
            haskellPackages.dbus
            haskellPackages.xmonad-contrib_0_18_1
            haskellPackages.xmonad-extras
        ];
    };

    packages = with pkgs; [
        feh
    ];
    
    xsessionInit = ''
        set +x
        ${pkgs.util-linux}/bin/setterm -blank 0 -powersave off -powerdown 0
        ${pkgs.xorg.xset}/bin/xset s off
    '';
in
{
    home = {
        inherit packages;
        sessionVariables = {
            DISPLAY = ":0";
        };
    };

    imports = [
        ./programs/alacritty
        ./programs/rofi
        ./services/picom
    ];

    xsession = {
        enable = true;
        initExtra = xsessionInit;
        scriptPath = ".xinitrc";
        windowManager.xmonad = xmonad;
    };
}