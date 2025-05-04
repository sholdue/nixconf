{ config, pkgs, ... }:

{
  home = {
    username = "sholdue";
    homeDirectory = "/home/sholdue";
    stateVersion = "24.11";

  file = {
    	".config/waybar/config.jsonc".source = ./waybar/config.jsonc;
        ".config/waybar/style.css".source = ./waybar/style.css;

    	".config/hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
    	".config/hypr/hyprland.conf".source = ./hypr/hyprland.conf;
  };

    packages = with pkgs; [
      neofetch
      htop
      yazi
      firefox
      telegram-desktop
      tealdeer
      trashy
      hyprpaper
      waybar
      hyprshot
      mako
   ];

    shellAliases = {
      nixup = "nix flake update --flake /home/sholdue/nix";
      nixswitch = "sudo nixos-rebuild switch --flake /home/sholdue/nix#world";
      hms = "home-manager switch --flake /home/sholdue/nix/home#sholdue";
      cleanup = "sudo nix-collect-garbage -d && sudo nix-env --delete-generations old && sudo nixos-rebuild boot";
      rm = "trash";
      rmdir = "trash";
    };
  };
  
  xdg.portal = {
  	enable = true;
  	extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  	config.common.default = "hyprland";
  };

  imports = [
      ./utils/fish.nix
      ./utils/git.nix
      ./utils/kitty.nix
  ];
}
